import { Controller, Post, Body, Get, Param, Put, Delete } from '@nestjs/common';
import { RatingService } from '../services/ratingService';
import { CreateRatingDto, UpdateRatingDto, DeleteRatingDto } from '../dtos/rating.dto';
import { Rating } from '../models/rating.model';
import { ApiBearerAuth } from '@nestjs/swagger';


@ApiBearerAuth()
@Controller('ratings')
export class RatingController {
  constructor(private readonly ratingService: RatingService) {}

  @Post()
  async createRating(@Body() createRatingDto: CreateRatingDto): Promise<Rating> {
    return this.ratingService.createRating(createRatingDto);
  }

  @Get(':id')
  async getRatingById(@Param('id') id: number): Promise<Rating | null> {
    return this.ratingService.getRatingById(id);
  }

  @Put(':id')
  async updateRating(@Param('id') id: number, @Body() updateRatingDto: UpdateRatingDto): Promise<Rating | null> {
    return this.ratingService.updateRating(id, updateRatingDto);
  }

  @Delete(':id')
  async deleteRating(@Param('id') id: number): Promise<void> {
    return this.ratingService.deleteRating(id);
  }
}
