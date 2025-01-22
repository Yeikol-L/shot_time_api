import { createZodDto } from 'nestjs-zod';
import {
  createCategorySchema,
  updateCategorySchema,
  deleteCategorySchema,
  createCategoryResponseSchmea,
  getAllCategoryResponseSchema,
  getCategoryByIdResponseSchema,
} from '../schemas/category.schema';

export class CreateCategoryDto extends createZodDto(createCategorySchema) {}
export class CreateCategoryResponseDto extends createZodDto(
  createCategoryResponseSchmea,
) {}
export class GetAllCategoryResponseDto extends createZodDto(
  getAllCategoryResponseSchema,
) {}
export class GetCategoryByIdDto extends createZodDto(
  getCategoryByIdResponseSchema,
) {}
export class UpdateCategoryDto extends createZodDto(updateCategorySchema) {}
export class DeleteCategoryDto extends createZodDto(deleteCategorySchema) {}
