import { createZodDto } from 'nestjs-zod';
import { changePasswordSchema, forgotPasswordSchema, loginSchema, registerSchema, verifyEmailSchema, verifyChangePasswordSchema, loginResponseSchema, registerResponseSchema, mesageResponseSchema } from '../schemas/auth.schema';
export class RegisterDto extends createZodDto(registerSchema) { }
export class RegisterResponseDto extends createZodDto(registerResponseSchema) { }
export class LoginDto extends createZodDto(loginSchema) { }
export class LoginResponseDto extends createZodDto(loginResponseSchema) { }
export class ChangePasswordDto extends createZodDto(changePasswordSchema) { }
export class ForgotPasswordDto extends createZodDto(forgotPasswordSchema) { }
export class VerifyEmailDto extends createZodDto(verifyEmailSchema) { }
export class VerifyChangePasswordDto extends createZodDto(verifyChangePasswordSchema) { }
export class MessageResponseDto extends createZodDto(mesageResponseSchema) { }

