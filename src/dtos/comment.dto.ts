import { createZodDto } from 'nestjs-zod';
import { createCommentSchema, updateCommentSchema, deleteCommentSchema } from '../schemas/comment.schema';

export class CreateCommentDto extends createZodDto(createCommentSchema) {}
export class UpdateCommentDto extends createZodDto(updateCommentSchema) {}
export class DeleteCommentDto extends createZodDto(deleteCommentSchema) {}
