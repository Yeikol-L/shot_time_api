import { z } from 'zod';

const dayEnum = z.enum([
  'monday',
  'tuesday',
  'wednesday',
  'thursday',
  'friday',
  'saturday',
  'sunday',
]);

export const availabilitySchema = z.object({
  id: z.number().int(),
  user_id: z.number().int(),
  day: dayEnum,
  opening_time: z.string().datetime(),
  closing_time: z.string().datetime(),
});

const extended = availabilitySchema.extend({
  opening_time: z.date(),
  closing_time: z.date(),
});

export const getAvailabilityByIdResponseSchema = extended;
export const createAvailabilityResponseSchema = extended;
export const getAllAvalabilitiesResponseSchema = z.object({
  results: z.array(availabilitySchema),
});

export const createAvailabilitySchema = availabilitySchema.omit({ id: true });
export const updateAvailabilitySchema = availabilitySchema.partial();
export const deleteAvailabilitySchema = availabilitySchema.pick({ id: true });
