import { categoriesTable } from '../db/schema';

export type InsertCategoryPayload = typeof categoriesTable.$inferInsert;
export type Category = typeof categoriesTable.$inferSelect;
