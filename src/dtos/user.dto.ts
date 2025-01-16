import { createZodDto } from 'nestjs-zod';
import { createUserSchema, updateUserSchema, deleteUserSchema } from '../schemas/user.schema';

export class CreateUserDto extends createZodDto(createUserSchema) {}
export class UpdateUserDto extends createZodDto(updateUserSchema) {}
export class DeleteUserDto extends createZodDto(deleteUserSchema) {}
