import { ratingsTable } from '../db/schema';

export type InsertRatingPayload = typeof ratingsTable.$inferInsert;
export type Rating = typeof ratingsTable.$inferSelect;
