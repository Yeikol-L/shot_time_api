import { usersTable } from '../db/schema';

export type InsertUserPayload = typeof usersTable.$inferInsert;
export type User = typeof usersTable.$inferSelect;

