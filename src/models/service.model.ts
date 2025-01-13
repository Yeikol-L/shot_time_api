import { servicesTable } from '../db/schema';

export type InsertServicePayload = typeof servicesTable.$inferInsert;
export type Service = typeof servicesTable.$inferSelect;
