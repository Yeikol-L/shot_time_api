import { eq } from 'drizzle-orm';
import { servicesTable } from '../db/schema';
import { InsertServicePayload, Service } from '../models/service.model';
import { Injectable } from '@nestjs/common';
import { Inject } from '@nestjs/common';
import { PG_CONNECTION } from 'src/constants';
import { NeonHttpDatabase } from 'drizzle-orm/neon-http';
import * as schema from "../db/schema";

@Injectable()
export class ServiceService {
  constructor(@Inject(PG_CONNECTION) private db: NeonHttpDatabase<typeof schema>){}
  async getAllServices(client_id?: number, category_id?: number): Promise<Service[]> {
    const servicesQuery = this.db.select().from(servicesTable);
    if(client_id) servicesQuery.where(eq(servicesTable.client_id, client_id));
    if(category_id) servicesQuery.where(eq(servicesTable.category_id, category_id));
    return await servicesQuery.execute();
  }
  async createService(data: InsertServicePayload): Promise<Service> {
    const service = await this.db.insert(servicesTable).values(data).returning();
    return service[0];
  }

  async getServiceById(id: number): Promise<Service | null> {
    const service = await this.db
      .select()
      .from(servicesTable)
      .where(eq(servicesTable.id, id))
      .execute();
    return service[0] || null;
  }

  async updateService(
    id: number,
    updateData: Partial<Service>,
  ): Promise<Service | null> {
    const service = await this.db
      .update(servicesTable)
      .set(updateData)
      .where(eq(servicesTable.id, id))
      .returning();
    return service[0] || null;
  }

  async deleteService(id: number): Promise<void> {
    await this.db.delete(servicesTable).where(eq(servicesTable.id, id)).execute();
  }

  async findServiceByProperties(properties: Partial<Service>): Promise<Service[]> {
    const query = this.db.select().from(servicesTable);
    for (const [key, value] of Object.entries(properties)) {
      query.where(eq(servicesTable[key as keyof Service], value as any));
    }
    const services = await query.execute();
    return services;
  }
}

