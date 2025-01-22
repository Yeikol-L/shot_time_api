import { z } from 'zod';

const roleCreateEnumSchema = z.enum(['client', 'user']);
const roleEnumSchema = z.enum(['client', 'user', 'admin']);

export const registerSchema = z.object({
  role: roleCreateEnumSchema,
  name: z.string().max(100),
  email: z.string().email().max(100),
  password_hash: z.string(),
  profile_picture: z.string().nullable(),
  business_name: z.string().max(100).nullable(),
  business_address: z.string().nullable(),
  phone_number: z.string().max(15).nullable(),
});
export const registerResponseSchema = z.object({
  id: z.number(),
  role: roleEnumSchema,
  name: z.string().max(100),
  email: z.string().email().max(100),
  profile_picture: z.string().nullable(),
  business_name: z.string().max(100).nullable(),
  business_address: z.string().nullable(),
  phone_number: z.string().max(15).nullable(),
  created_at: z.date(),
  verified: z.boolean(),
});

export const mesageResponseSchema = z.object({
  message: z.string(),
});

export const loginSchema = z.object({
  email: z.string().email().max(100),
  password: z.string(),
});
export const loginResponseSchema = z.object({
  access_token: z.string(),
});

export const changePasswordSchema = z.object({
  email: z.string().email().max(100),
  oldPassword: z.string(),
  newPassword: z.string(),
})

export const forgotPasswordSchema = z.object({
  email: z.string().email().max(100)
});

export const verifyChangePasswordSchema = z.object({
  email: z.string().email().max(100),
  newPassword: z.string(),
  code: z.number(),
});

export const verifyEmailSchema = z.object({
  code: z.number(),
});
