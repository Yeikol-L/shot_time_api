import { z } from 'zod'

const dayEnum = z.enum([
  'monday',
  'tuesday',
  'wednesday',
  'thursday',
  'friday',
  'saturday',
  'sunday',
])

export const availabilitySchema = z.object({
  id: z.number().int(),
  service_id: z.number().int(),
  day: dayEnum,
  start_time: z.date(),
  end_time: z.date(),
})

export const createAvailabilitySchema = availabilitySchema.omit({ id: true });
export const updateAvailabilitySchema = availabilitySchema.partial();
export const deleteAvailabilitySchema = availabilitySchema.pick({ id: true });
