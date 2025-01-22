import { z } from 'zod';
import { reservationStatus } from '../db/schema';
import { serviceSchema } from './service.schema';

export const reservationSchema = z.object({
  id: z.number().optional(),
  user_id: z.number(),
  service_id: z.number(),
  date: z.string().date(),
  start_time: z.string().datetime(),
  end_time: z.string().datetime(),
  status: z.enum(reservationStatus.enumValues),
});
const extended = reservationSchema.extend({
  start_time: z.date(),
  end_time: z.date(),
  date: z.date(),
});
export const createReservationSchema = reservationSchema.omit({ id: true });
export const createReservationResponseSchema = extended;
export const updateReservationSchema = reservationSchema
  .partial()
  .omit({ id: true });
export const deleteReservationSchema = reservationSchema.pick({ id: true });
export const getReservationResultSchema = extended;
export const searchReservationSchema = z.object({
  results: z.array(extended.extend({ service: serviceSchema})),
});
