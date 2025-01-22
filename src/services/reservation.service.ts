import { eq, or } from 'drizzle-orm';
import { reservationsTable } from '../db/schema';
import {
  InsertReservationPayload,
  Reservation,
} from '../models/reservation.model';
import { Inject, Injectable } from '@nestjs/common';
import { PG_CONNECTION } from 'src/constants';
import { NeonHttpDatabase } from 'drizzle-orm/neon-http';
import * as schema from '../db/schema';
import { Service } from 'src/models/service.model';

@Injectable()
export class ReservationService {
  constructor(
    @Inject(PG_CONNECTION) private db: NeonHttpDatabase<typeof schema>,
  ) {}

  async getAll(
    user_id: number,
  ) {
    const result = await this.db.query.reservationsTable.findMany({
      where: or(
        eq(reservationsTable.user_id, user_id),
        eq(reservationsTable.user_id, user_id),
      ),
      with: {
        service: true,
      },
    });
    return result;
  }
  async createReservation(
    data: InsertReservationPayload,
  ): Promise<Reservation> {
    const reservation = await this.db
      .insert(reservationsTable)
      .values(data)
      .returning();
    return reservation[0];
  }

  async getReservationById(id: number): Promise<Reservation | null> {
    const reservation = await this.db
      .select()
      .from(reservationsTable)
      .where(eq(reservationsTable.id, id))
      .execute();
    return reservation[0] || null;
  }

  async updateReservation(
    id: number,
    updateData: Partial<Reservation>,
  ): Promise<Reservation | null> {
    const reservation = await this.db
      .update(reservationsTable)
      .set(updateData)
      .where(eq(reservationsTable.id, id))
      .returning();
    return reservation[0] || null;
  }

  async deleteReservation(id: number) {
    return await this.db
      .delete(reservationsTable)
      .where(eq(reservationsTable.id, id))
      .execute();
  }

  async findReservationByProperties(
    properties: Partial<Reservation>,
  ): Promise<Reservation[]> {
    const query = this.db.select().from(reservationsTable);
    for (const [key, value] of Object.entries(properties)) {
      query.where(
        eq(reservationsTable[key as keyof Reservation], value as any),
      );
    }
    const reservations = await query.execute();
    return reservations;
  }
}
