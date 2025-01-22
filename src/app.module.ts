import { Module } from '@nestjs/common';
import { UserController } from './controllers/user.controller';
import { CategoryController } from './controllers/category.controller';
import { RatingController } from './controllers/rating.controller';
import { ServiceController } from './controllers/service.controller';
import { CategoryService } from './services/category.service';
import { RatingService } from './services/rating.service';
import { ServiceService } from './services/service.service';
import { UserService } from './services/user.service';
import { ConfigModule } from '@nestjs/config';
import { DrizzleModule } from './db/db.module';
import { AuthModule } from './auth/auth.module';
import { JwtService } from '@nestjs/jwt';
import { AvailabilityController } from './controllers/availability.controller';
import { AvailabilityService } from './services/availability.service';
import { ReservationController } from './controllers/reservation.controller';
import { ReservationService } from './services/reservation.service';
import { ProfileController } from './controllers/profile.controller';
import { ProfileService } from './services/profile.service';
import { MailService } from './services/mail.service';

@Module({
  imports: [
    AuthModule,
    DrizzleModule,
    ConfigModule.forRoot({ isGlobal: true }),
  ],
  controllers: [
    UserController,
    CategoryController,
    ServiceController,
    AvailabilityController,
    RatingController,
    ProfileController,
    ReservationController
  ],
  providers: [
    MailService,
    CategoryService,
    RatingService,
    ServiceService,
    UserService,
    AvailabilityService,
    ReservationService,
    ProfileService,
    JwtService,
  ],
})
export class AppModule {}
