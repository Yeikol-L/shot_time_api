import { decimalString } from "src/utils";
import { z } from "zod";

export const ratingSchema = z.object({
  id: z.number().int(),
  user_id: z.number().int(),
  service_id: z.number().int(),
  rating: decimalString(3, 2),
});

export const createRatingSchema = ratingSchema.omit({ id: true });
export const updateRatingSchema = createRatingSchema.partial();
export const deleteRatingSchema = z.object({
  id: z.number().int(),
});
