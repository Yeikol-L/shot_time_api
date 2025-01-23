import { Inject, Injectable } from '@nestjs/common';
import { Availability } from '../models/availability.model';
import { CreateAvailabilityDto } from '../dtos/availability.dto';
import { PG_CONNECTION } from 'src/constants';
import { NeonHttpDatabase } from 'drizzle-orm/neon-http';
import * as schema from '../db/schema';
import { eq, and, or, not } from 'drizzle-orm';
import { availabilityTable, reservationsTable } from '../db/schema';
import {areIntervalsOverlapping} from 'date-fns'

@Injectable()
export class AvailabilityService {
  constructor(
    @Inject(PG_CONNECTION) private db: NeonHttpDatabase<typeof schema>,
  ) {}

  async createAvailability(data: CreateAvailabilityDto): Promise<Availability> {
    const availability = await this.db
      .insert(availabilityTable)
      .values({
        ...data,
        opening_time: new Date(data.opening_time),
        closing_time: new Date(data.opening_time),
      })
      .returning();
    return availability[0];
  }

  async getAvailabilityOfClient(
    user_id: number,
    date: Date,
    service_duration: number,
  ): Promise<{
    results: { startTime: string; endTime: string; available: boolean }[];
  }> {

    const dayOfWeek = date.getDay();
    let day: string;
    switch (dayOfWeek) {
      case 0:
        day = 'sunday';
        break;
      case 1:
        day = 'monday';
        break;
      case 2:
        day = 'tuesday';
        break;
      case 3:
        day = 'wednesday';
        break;
      case 4:
        day = 'thursday';
        break;
      case 5:
        day = 'friday';
        break;
      case 6:
        day = 'saturday';
        break;
      default:
        throw new Error('Invalid day');
    }

    const availability = await this.db.query.availabilityTable.findFirst({
      where: and(
        eq(availabilityTable.day, day as any),
        eq(availabilityTable.user_id, user_id),
      ),
    });
    if(!availability) return { results: [] };

    const reservations = await this.db
      .select()
      .from(reservationsTable)
      .where(
        and(
          eq(schema.servicesTable.client_id, user_id),
          // not(eq(reservationsTable.status, 'pending')),
        ),
      )
      .innerJoin(
        schema.servicesTable,
        eq(reservationsTable.service_id, schema.servicesTable.id),
      )
      .execute()
      .then((e) => e.flatMap((e) => e.reservations))
      .then((reservations) =>
        reservations.filter(
          (reservation) =>{
            console.log(reservation.date)
            console.log(date)
            return reservation.date.toISOString().substring(0, 10) === date.toISOString().substring(0, 10)
          }
        ),
      );

    const timeRanges = this.generateTimeRanges(
      service_duration,
      availability.opening_time || new Date(),
      availability.closing_time || new Date(),
    );

    const results = timeRanges.map((range) => {
      // Handle canse where the range.endTime is equal to range.startTime
      if (range.endTime.getTime() === range.startTime.getTime()) {
        return {
          startTime: range.startTime,
          endTime: range.endTime,
          available: false,
        };
      }
      const getTimeAsNumber = (date: Date) =>  date.getHours() * 60 + date.getMinutes();

      const isAvailable = !reservations.some( (reservation) =>
          areIntervalsOverlapping(
            { start: getTimeAsNumber(reservation.start_time), end: getTimeAsNumber(reservation.end_time) },
            { start: getTimeAsNumber(range.startTime), end: getTimeAsNumber(range.endTime) }
          )
      );
      
      // const isAvailable = !reservations.some( (reservation) =>
      //     reservation.start_time <= range.endTime &&
      //     reservation.end_time >= range.startTime,
      // );
      return {
        startTime: range.startTime,
        endTime: range.endTime,
        available: isAvailable,
      };
    });
    return {
      results: results.map((result) => ({
        startTime: result.startTime.toISOString().substring(11, 16),
        endTime: result.endTime.toISOString().substring(11,16),
        available: result.available,
      })),
    };
  }

  private generateTimeRanges(
    service_duration: number,
    startTime: Date,
    endTime: Date,
  ): { startTime: Date; endTime: Date }[] {
    const ranges: { startTime: Date; endTime: Date }[] = [];
    const getTotalMinutesBetweenDates = (date1: Date, date2: Date) =>
      Math.floor((date2.getTime() - date1.getTime()) / 60000);
    const totalMinutes = getTotalMinutesBetweenDates(startTime, endTime);

    for (let i = 0; i < totalMinutes; i += service_duration) {
      ranges.push({
        startTime: new Date(startTime.getTime() + i * 60000),
        endTime: new Date(startTime.getTime() + (i + service_duration) * 60000),
      });
    }
    
    return ranges;
  }

  async getAvailabilityById(id: number): Promise<Availability | null> {
    const availability = await this.db
      .select()
      .from(availabilityTable)
      .where(eq(availabilityTable.id, id))
      .execute();
    return availability[0] || null;
  }

  async updateAvailability(
    id: number,
    updateData: Partial<Availability>,
  ): Promise<Availability | null> {
    const availability = await this.db
      .update(availabilityTable)
      .set(updateData)
      .where(eq(availabilityTable.id, id))
      .returning();
    return availability[0] || null;
  }

  async deleteAvailability(id: number): Promise<void> {
    await this.db
      .delete(availabilityTable)
      .where(eq(availabilityTable.id, id))
      .execute();
  }

  async findAvailabilityByProperties(
    properties: Partial<Availability>,
  ): Promise<Availability[]> {
    const query = this.db.select().from(availabilityTable);
    for (const [key, value] of Object.entries(properties)) {
      query.where(
        eq(availabilityTable[key as keyof Availability], value as any),
      );
    }
    const availabilities = await query.execute();
    return availabilities;
  }
}
