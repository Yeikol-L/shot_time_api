import { Module } from '@nestjs/common';
import { drizzle, NeonHttpDatabase} from 'drizzle-orm/neon-http';
import {neon} from "@neondatabase/serverless";
import * as schema from './schema';
import { ConfigService } from '@nestjs/config';
import { PG_CONNECTION } from 'src/constants';
@Module({
  providers: [
    {
      provide: PG_CONNECTION,
      inject: [ConfigService],
      useFactory: async (configService: ConfigService) => {
        const connectionString = configService.get<string>('DATABASE_URL') as string;
        const sql = neon(connectionString);
        return drizzle({client: sql, schema}) as NeonHttpDatabase<typeof schema>;
      },
    },
  ],
  exports: [PG_CONNECTION],
})
export class DrizzleModule {}
