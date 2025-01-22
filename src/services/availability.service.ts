import { Inject, Injectable } from '@nestjs/common';
import { Availability } from '../models/availability.model';
import { CreateAvailabilityDto } from '../dtos/availability.dto';
import { PG_CONNECTION } from 'src/constants';
import { NeonHttpDatabase } from 'drizzle-orm/neon-http';
import * as schema from '../db/schema';
import { eq } from 'drizzle-orm';
import { availabilityTable } from '../db/schema';

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
