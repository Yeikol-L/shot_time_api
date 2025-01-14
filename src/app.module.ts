import { Module } from '@nestjs/common';
import { UserController } from './controllers/user.controller';
import { CategoryController } from './controllers/category.controller';
import { CommentController } from './controllers/comment.controller';
import { RatingController } from './controllers/rating.controller';
import { ServiceController } from './controllers/service.controller';
import { CategoryService } from './services/category.service';
import { CommentService } from './services/comment.service';
import { RatingService } from './services/rating.service';
import { ServiceService } from './services/service.service';
import { UserService } from './services/user.service';
import { ConfigModule } from '@nestjs/config';
import { DrizzleModule } from './db/db.module';
import { AuthModule } from './auth/auth.module';
import { JwtService } from '@nestjs/jwt';


@Module({
  imports: [DrizzleModule, ConfigModule.forRoot({ isGlobal: true }), AuthModule],
  controllers: [CategoryController, CommentController, RatingController, ServiceController, UserController],
  providers: [CategoryService, CommentService, RatingService, ServiceService, UserService, JwtService],
})
export class AppModule { }
