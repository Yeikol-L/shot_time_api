import { createZodDto } from 'nestjs-zod';
import { createUserSchema, updateUserSchema, deleteUserSchema, CreateUserResponseSchema, getAllClientsResponseSchema, getUserByIdResponseSchema } from '../schemas/user.schema';

export class CreateUserDto extends createZodDto(createUserSchema) {}
export class CreateUserResponseDto extends createZodDto(CreateUserResponseSchema) {}
export class GetAllClientsResponseDto extends createZodDto(getAllClientsResponseSchema) {}
export class GetUserByIdResponseDto extends createZodDto(getUserByIdResponseSchema) {}
export class UpdateUserDto extends createZodDto(updateUserSchema) {}
export class DeleteUserDto extends createZodDto(deleteUserSchema) {}
