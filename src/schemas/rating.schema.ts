import { decimalString } from "src/utils";
import { z } from "zod";

export const ratingSchema = z.object({
  id: z.number().int(),
  user_id: z.number().int(),
  service_id: z.number().int(),
  reservation_id: z.number().int(),
  comment: z.string(),
  response: z.string().nullable(),
  commentDate: z.date(),
  responseDate: z.date().nullable(),
  rating: decimalString(3, 2),
});

export const createRatingSchema = ratingSchema.omit({ id: true });
export const createRatingResponseSchema = ratingSchema;
export const updateRatingSchema = createRatingSchema.partial().omit({reservation_id: true, user_id: true, service_id: true });
export const deleteRatingSchema = z.object({
  id: z.number().int(),
});

export const getAllRatingSchema = z.object({
  results: z.array(ratingSchema),
});
