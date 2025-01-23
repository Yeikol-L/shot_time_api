import { eq } from 'drizzle-orm';
import { ratingsTable } from '../db/schema';
import { InsertRatingPayload, Rating } from '../models/rating.model';
import { Inject, Injectable } from '@nestjs/common';
import { NeonHttpDatabase } from 'drizzle-orm/neon-http';
import * as schema from "../db/schema";
import { PG_CONNECTION } from 'src/constants';

@Injectable()
export class RatingService {
  constructor(@Inject(PG_CONNECTION) private db: NeonHttpDatabase<typeof schema>){}
  async createRating(data: InsertRatingPayload): Promise<Rating> {
    const rating = await this.db.insert(ratingsTable).values(data).returning();
    return rating[0];
  }
  async getAll(service_id: number): Promise<Rating[]> {
    const ratings = await this.db.select().from(ratingsTable).where(eq(ratingsTable.service_id, service_id)).execute();
    return ratings;
  }

  async getRatingById(id: number): Promise<Rating | null> {
    const rating = await this.db
      .select()
      .from(ratingsTable)
      .where(eq(ratingsTable.id, id))
      .execute();
    return rating[0] || null;
  }

  async updateRating(
    id: number,
    updateData: Partial<Rating>,
  ): Promise<Rating | null> {
    const rating = await this.db
      .update(ratingsTable)
      .set(updateData)
      .where(eq(ratingsTable.id, id))
      .returning();
    return rating[0] || null;
  }

  async deleteRating(id: number): Promise<void> {
    await this.db.delete(ratingsTable).where(eq(ratingsTable.id, id)).execute();
  }
  async findRatingByClient(client_id: number): Promise<Rating[]> {
    const ratings = await this.db
      .select()
      .from(ratingsTable)
      .where(eq(schema.servicesTable.client_id, client_id))
        .innerJoin(schema.servicesTable, eq(ratingsTable.service_id, schema.servicesTable.id))
      .execute();
    return ratings.map(e => e.ratings);
  }

  async findRatingByProperties(properties: Partial<Rating>): Promise<Rating[]> {
    const query = this.db.select().from(ratingsTable);
    for (const [key, value] of Object.entries(properties)) {
      query.where(eq(ratingsTable[key as keyof Rating], value as any));
    }
    const ratings = await query.execute();
    return ratings;
  }
}

