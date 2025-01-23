import { decimalString } from "src/utils";
import { z } from "zod";



export const serviceSchema = z.object({
  id: z.number().int(),
  client_id: z.number().int(),
  name: z.string().max(100),
  description: z.string().nullable(),
  price : decimalString(10, 2),
  rating: decimalString(3, 2).nullable(),
  service_duration: z.number().int().positive().default(30),
});

export const createServiceSchema = serviceSchema.omit({ id: true });
export const createServiceSchemaResponse = serviceSchema;
export const getServiceSchemaByIdResponse = serviceSchema;
export const getAllServicesSchemaResponse = z.object({
  results: z.array(serviceSchema),
});
export const updateServiceSchema = createServiceSchema.partial();
export const deleteServiceSchema = z.object({
  id: z.number().int(),
});
