import { eq } from 'drizzle-orm';
import { commentsTable } from '../db/schema';
import { InsertCommentPayload, Comment } from '../models/comment.model';
import { Inject, Injectable } from '@nestjs/common';
import { NeonHttpDatabase } from 'drizzle-orm/neon-http';
import * as schema from "../db/schema";
import { PG_CONNECTION } from 'src/constants';

@Injectable()
export class CommentService {
  constructor(@Inject(PG_CONNECTION) private db: NeonHttpDatabase<typeof schema>){}
  async createComment(data: InsertCommentPayload): Promise<Comment> {
    const comment = await this.db.insert(commentsTable).values(data).returning();
    return comment[0];
  }

  async getCommentById(id: number): Promise<Comment | null> {
    const comment = await this.db
      .select()
      .from(commentsTable)
      .where(eq(commentsTable.id, id))
      .execute();
    return comment[0] || null;
  }

  async updateComment(
    id: number,
    updateData: Partial<Comment>,
  ): Promise<Comment | null> {
    const comment = await this.db
      .update(commentsTable)
      .set(updateData)
      .where(eq(commentsTable.id, id))
      .returning();
    return comment[0] || null;
  }

  async deleteComment(id: number): Promise<void> {
    await this.db.delete(commentsTable).where(eq(commentsTable.id, id)).execute();
  }

  async findCommentByProperties(properties: Partial<Comment>): Promise<Comment[]> {
    const query = this.db.select().from(commentsTable);
    for (const [key, value] of Object.entries(properties)) {
      query.where(eq(commentsTable[key as keyof Comment], value as any));
    }
    const comments = await query.execute();
    return comments;
  }
}

