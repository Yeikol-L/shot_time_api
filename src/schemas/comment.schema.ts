import { z } from "zod";

export const commentSchema = z.object({
  id: z.number().int(),
  user_id: z.number().int(),
  service_id: z.number().int(),
  comment: z.string(),
  parentComment: z.number().int().optional(),
});

export const createCommentSchema = commentSchema.omit({ id: true });
export const updateCommentSchema = createCommentSchema.partial();
export const deleteCommentSchema = z.object({
  id: z.number().int(),
});
