import { eq } from 'drizzle-orm';
import { categoriesTable } from '../db/schema';
import { InsertCategoryPayload, Category } from '../models/category.model';
import { Inject, Injectable } from '@nestjs/common';
import { PG_CONNECTION } from 'src/constants';
import { NeonHttpDatabase } from 'drizzle-orm/neon-http';
import * as schema from "../db/schema";

@Injectable()
export class CategoryService {
  constructor(@Inject(PG_CONNECTION) private db: NeonHttpDatabase<typeof schema>){}
  async createCategory(data: InsertCategoryPayload): Promise<Category> {
    const category = await this.db.insert(categoriesTable).values(data).returning();
    return category[0];
  }

  async getCategoryById(id: number): Promise<Category | null> {
    const category = await this.db
      .select()
      .from(categoriesTable)
      .where(eq(categoriesTable.id, id))
      .execute();
    return category[0] || null;
  }

  async updateCategory(
    id: number,
    updateData: Partial<Category>,
  ): Promise<Category | null> {
    const category = await this.db
      .update(categoriesTable)
      .set(updateData)
      .where(eq(categoriesTable.id, id))
      .returning();
    return category[0] || null;
  }

  async deleteCategory(id: number): Promise<void> {
    await this.db.delete(categoriesTable).where(eq(categoriesTable.id, id)).execute();
  }

  async findCategoryByProperties(properties: Partial<Category>): Promise<Category[]> {
    const query = this.db.select().from(categoriesTable);
    for (const [key, value] of Object.entries(properties)) {
      query.where(eq(categoriesTable[key as keyof Category], value as any));
    }
    const categories = await query.execute();
    return categories;
  }
}

