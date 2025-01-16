import { createZodDto } from 'nestjs-zod';
import { createRatingSchema, updateRatingSchema, deleteRatingSchema } from '../schemas/rating.schema';

export class CreateRatingDto extends createZodDto(createRatingSchema) {}
export class UpdateRatingDto extends createZodDto(updateRatingSchema) {}
export class DeleteRatingDto extends createZodDto(deleteRatingSchema) {}
