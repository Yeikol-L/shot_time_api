import { z } from 'zod';

const roleEnumSchema = z.enum(['client', 'user']);

export const registerSchema = z.object({
  role: roleEnumSchema,
  name: z.string().max(100),
  email: z.string().email().max(100),
  password_hash: z.string(),
  profile_picture: z.string().nullable(),
  business_name: z.string().max(100).nullable(),
  business_address: z.string().nullable(),
  phone_number: z.string().max(15).nullable(),
});

export const loginSchema = z.object({
  email: z.string().email().max(100),
  password: z.string(),
});
