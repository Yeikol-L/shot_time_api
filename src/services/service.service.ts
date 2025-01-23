import { eq } from 'drizzle-orm';
import { servicesTable } from '../db/schema';
import { InsertServicePayload, Service } from '../models/service.model';
import { Injectable } from '@nestjs/common';
import { Inject } from '@nestjs/common';
import { PG_CONNECTION } from 'src/constants';
import { NeonHttpDatabase } from 'drizzle-orm/neon-http';
import * as schema from "../db/schema";
import { PutObjectCommandInput, S3Client } from '@aws-sdk/client-s3';
import { Upload } from '@aws-sdk/lib-storage';

@Injectable()
export class ServiceService {
  private readonly s3: S3Client;
  constructor(@Inject(PG_CONNECTION) private db: NeonHttpDatabase<typeof schema>){
    this.s3 = new S3Client({
      credentials: {
        accessKeyId: process.env.AWS_ACCESS_KEY_ID as string,
        secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY as string,
      },
    });
  }
  async uploadServicePicture(
    file: Express.Multer.File,
    serviceId: number,
  ): Promise<void> {
    try {
      const params: PutObjectCommandInput = {
        Bucket: "short-time-api",
        Key: "",
        ContentType: file.mimetype,
        Body: file.buffer,
      };
      // create arandom name
      const randomName = `${Math.random().toString(36).substring(2, 15) + Math.random().toString(36).substring(2, 15)}`;
      // create a new name for the file
      const newFileName = `${randomName}.${file.originalname.split('.').pop()}`;
      params.Key = newFileName;

      const upload = new Upload({
        params,
        client: this.s3,
      });
      const result = await upload.done();
      await this.updateService(serviceId, {
        picture: result.Location,
      });
    } catch (error) {
      console.error(error);
    }
  }

  async getAllServices(client_id?: number): Promise<Service[]> {
    const servicesQuery = this.db.select().from(servicesTable);
    if(client_id) servicesQuery.where(eq(servicesTable.client_id, client_id));
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

