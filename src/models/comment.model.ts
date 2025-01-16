import { commentsTable } from '../db/schema';

export type InsertCommentPayload = typeof commentsTable.$inferInsert;
export type Comment = typeof commentsTable.$inferSelect;
