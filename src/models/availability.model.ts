import { availabilityTable } from '../db/schema';

export type InsertAvailabilityPayload = typeof availabilityTable.$inferInsert;
export type Availability = typeof availabilityTable.$inferSelect;
