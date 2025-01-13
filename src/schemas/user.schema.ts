import { z } from "zod";

export const roleEnumSchema = z.enum(['client', 'user', 'admin']);

export const userSchema = z.object({
  id: z.number().int(),
  role: roleEnumSchema,
  name: z.string().max(100),
  email: z.string().email().max(100),
  password_hash: z.string(),
  profile_picture: z.string().nullable(),
  created_at: z.string(),
  business_name: z.string().max(100).nullable(),
  business_address: z.string().nullable(),
  phone_number: z.string().max(15).nullable(),
});

export const createUserSchema = userSchema.omit({ id: true, created_at: true });
export const updateUserSchema = createUserSchema.partial();
export const deleteUserSchema = z.object({
  id: z.number().int(),
});
