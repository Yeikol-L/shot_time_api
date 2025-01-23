import { z } from "zod";

export const roleEnumSchema = z.enum(['client', 'user', 'admin']);

export const userSchema = z.object({
  id: z.number().int(),
  role: roleEnumSchema,
  name: z.string().max(100),
  email: z.string().email().max(100),
  password_hash: z.string(),
  profile_picture: z.string().nullable(),
  category_id: z.number().int().nullable(),
  created_at: z.string().datetime(),
  rating: z.string().nullable(),
  business_name: z.string().max(100).nullable(),
  business_address: z.string().nullable(),
  phone_number: z.string().max(15).nullable(),
});
const extend = userSchema.extend({ created_at: z.date() });
export const createUserSchema = userSchema.omit({ id: true, created_at: true });
export const CreateUserResponseSchema = extend.omit({ password_hash: true });
export const getAllClientsResponseSchema = z.object({
  results: z.array(extend.omit({ password_hash: true })),
});
export const getUserByIdResponseSchema = extend.omit({ password_hash: true });
export const updateUserSchema = createUserSchema.partial();
export const deleteUserSchema = z.object({
  id: z.number().int(),
});
