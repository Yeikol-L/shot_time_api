import { createZodDto } from 'nestjs-zod';
import { createRatingSchema, updateRatingSchema, extended,deleteRatingSchema, getAllRatingSchema, createRatingResponseSchema, ratingSchema } from '../schemas/rating.schema';

export class RatingDto extends createZodDto(extended) {}
export class CreateRatingDto extends createZodDto(createRatingSchema) {}
export class CreateRatingResponseDto extends createZodDto(createRatingResponseSchema) {}
export class UpdateRatingDto extends createZodDto(updateRatingSchema) {}
export class DeleteRatingDto extends createZodDto(deleteRatingSchema) {}
export class GetAllRatingsDto extends createZodDto(getAllRatingSchema) {}
