import {
  Controller,
  Post,
  Body,
  Get,
  Param,
  Put,
  Delete,
  UseGuards,
  BadRequestException,
  NotFoundException,
} from '@nestjs/common';
import { RatingService } from '../services/rating.service';
import {
  CreateRatingDto,
  CreateRatingResponseDto,
  RatingDto,
  UpdateRatingDto,
  GetAllRatingsDto,
} from '../dtos/rating.dto';
import { Rating } from '../models/rating.model';
import { ApiBearerAuth } from '@nestjs/swagger';
import { AuthGuard } from 'src/auth/auth.guard';
import { User, UserInfo } from 'src/user.decorator';
import { ReservationService } from 'src/services/reservation.service';
import { MessageResponseDto } from 'src/dtos/auth.dto';

@ApiBearerAuth()
@UseGuards(AuthGuard)
@Controller('ratings')
export class RatingController {
  constructor(
    private readonly ratingService: RatingService,
    private readonly reservationService: ReservationService,
  ) {}
  @Post()
  async createRating(
    @Body() createRatingDto: CreateRatingDto,
    @User() user: UserInfo,
  ): Promise<CreateRatingResponseDto> {
    const reservation = await this.reservationService.getReservationById(
      createRatingDto.reservation_id,
    );
    if (!reservation) throw new BadRequestException('Reservation not found');
    if (reservation.user_id !== user.sub)
      throw new BadRequestException('You can only rate your own reservations');
    if (reservation.status === 'done')
      return await this.ratingService.createRating(createRatingDto);
    throw new BadRequestException('You can only rate done reservations');
  }
  @Get('/:id/all')
  async getAllRatings(@Param('id') id: number): Promise<GetAllRatingsDto> {
    return {
      results: await this.ratingService.getAll(id),
    };
  }

  @Get('/:id')
  async getRatingById(
    @Param('id') id: number,
    @User() user: UserInfo,
  ): Promise<RatingDto> {
    if (user.role === 'admin') {
      const rating = await this.ratingService.getRatingById(id);
      if (!rating) throw new NotFoundException();
      return rating;
    }
    const rating = await this.ratingService.getRatingById(id);
    if (!rating) throw new NotFoundException();
    if (rating.user_id === user.sub) return rating;
    throw new BadRequestException('You can only see your own ratings');
  }

  @Put('/:id')
  async updateRating(
    @Param('id') id: number,
    @Body() updateRatingDto: UpdateRatingDto,
    @User() user: UserInfo,
  ): Promise<MessageResponseDto> {
    const rating = await this.ratingService.getRatingById(id);
    if (!rating) throw new NotFoundException();
    if (rating.user_id !== user.sub)
      throw new BadRequestException('You can only update your own ratings');
    const result = await this.ratingService.updateRating(id, updateRatingDto);
    if (!result) throw new NotFoundException('Rating not found');
    return { message: 'Rating updated successfully' };
  }

  @Delete('/:id')
  async deleteRating(
    @Param('id') id: number,
    @User() user: UserInfo,
  ): Promise<MessageResponseDto> {
    const rating = await this.ratingService.getRatingById(id);
    if (!rating) throw new BadRequestException('Rating not found');
    if (rating.user_id !== user.sub)
      throw new BadRequestException('You can only delete your own ratings');
    await this.ratingService.deleteRating(id);
    return { message: 'Rating deleted successfully' };
  }
}
