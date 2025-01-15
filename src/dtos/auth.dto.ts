import { createZodDto } from 'nestjs-zod';
import { changePasswordSchema, loginSchema, registerSchema } from '../schemas/auth.schema';
export class RegisterDto extends createZodDto(registerSchema) { }
export class LoginDto extends createZodDto(loginSchema) { }
export class ChangePasswordDto extends createZodDto(changePasswordSchema) { }
