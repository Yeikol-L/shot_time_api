import { eq } from 'drizzle-orm';
import { usersTable } from '../db/schema';
import { InsertUserPayload, User } from '../models/user.model';
import { Injectable, InternalServerErrorException } from '@nestjs/common';
import { Inject } from '@nestjs/common';
import { PG_CONNECTION } from 'src/constants';
import { NeonHttpDatabase } from 'drizzle-orm/neon-http';
import * as schema from "../db/schema";

@Injectable()
export class UserService {
  constructor(@Inject(PG_CONNECTION) private db: NeonHttpDatabase<typeof schema>) { }
  async createUser(userData: InsertUserPayload): Promise<Omit<User, 'password_hash' | 'verification_code' | 'change_password_code'>> {
    const {password_hash,verification_code,...user} = (await this.db.insert(usersTable).values(userData).returning())[0];
    if(!user) 
      throw new InternalServerErrorException("Error creating user");

    return user!;
  }

  async getUserById(userId: number): Promise<User | null> {
    let result = await this.db
      .select()
      .from(usersTable)
      .where(eq(usersTable.id, userId))
      .execute();
    if (result[0]) {
      const user  = result[0];
      return user;
    }
    return null;
  }

  async updateUser(
    userId: number,
    updateData: Partial<User>,
  ): Promise<User | null> {
    const user = await this.db
      .update(usersTable)
      .set(updateData)
      .where(eq(usersTable.id, userId))
      .returning();
    return user[0] || null;
  }

  async deleteUser(userId: number): Promise<void> {
    await this.db.delete(usersTable).where(eq(usersTable.id, userId)).execute();
  }

  async findUserByProperties(properties: Partial<User>): Promise<User[]> {
    const query = this.db.select().from(usersTable);
    for (const [key, value] of Object.entries(properties)) {
      query.where(eq(usersTable[key as keyof User], value as any));
    }
    const users = await query.execute();
    return users;
  }
}

