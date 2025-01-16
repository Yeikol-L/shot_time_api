import { decimalString } from "src/utils";
import { z } from "zod";



export const serviceSchema = z.object({
  id: z.number().int(),
  client_id: z.number().int(),
  name: z.string().max(100),
  description: z.string().nullable(),
  price : decimalString(10, 2),
  category_id: z.number().nullable(),
  rating: decimalString(3, 2).nullable(),
});

export const createServiceSchema = serviceSchema.omit({ id: true });
export const updateServiceSchema = createServiceSchema.partial();
export const deleteServiceSchema = z.object({
  id: z.number().int(),
});
