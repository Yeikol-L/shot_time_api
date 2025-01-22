import { z } from "zod";

export const categorySchema = z.object({
  id: z.number().int(),
  name: z.string().max(100),
});

export const createCategorySchema = categorySchema.omit({ id: true });
export const createCategoryResponseSchmea = categorySchema;
export const getAllCategoryResponseSchema = z.object({
  results: z.array(categorySchema),
});
export const getCategoryByIdResponseSchema = categorySchema;
export const updateCategorySchema = createCategorySchema.partial();
export const deleteCategorySchema = z.object({
  id: z.number().int(),
});
