import { reservationsTable } from '../db/schema';

export type InsertReservationPayload = typeof reservationsTable.$inferInsert;
export type Reservation = typeof reservationsTable.$inferSelect;