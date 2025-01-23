import {
  Controller,
  Post,
  Body,
  Get,
  Param,
  Put,
  Delete,
  UseGuards,
  UnauthorizedException,
  BadRequestException,
  NotFoundException,
} from '@nestjs/common';
import { ReservationService } from '../services/reservation.service';
import {
  InsertReservationPayload,
  Reservation,
} from '../models/reservation.model';
import { AuthGuard } from 'src/auth/auth.guard';
import { ApiBearerAuth } from '@nestjs/swagger';
import { User, UserInfo } from 'src/user.decorator';
import {
  CreateReservationDto,
  CreateReservationResponseDto,
  GetReservationResponseDto,
  SearchReservationResponseDto as GetAllReservationResponseDto,
  UpdateReservationDto,
} from 'src/dtos/reservation.dto';
import { MessageResponseDto } from 'src/dtos/auth.dto';

@ApiBearerAuth()
@UseGuards(AuthGuard)
@Controller('reservations')
export class ReservationController {
  constructor(private readonly reservationService: ReservationService) {}

  @Get("/all")
  async searchReservation(@User() user: UserInfo): Promise<GetAllReservationResponseDto> {
    const reservations = await this.reservationService.getAll(user.sub);
    return {
      results: reservations,
    }
  }

  @Post()
  async createReservation(
    @Body() createReservationDto: CreateReservationDto,
    @User() user: UserInfo,
  ): Promise<CreateReservationResponseDto> {
    const { start_time, end_time, date, ...rest } = createReservationDto;
    if (user.role === 'admin')
      return this.reservationService.createReservation({
        start_time: new Date(start_time),
        end_time: new Date(end_time),
        date: new Date(date),
        ...rest,
      });
      console.log(user.sub, createReservationDto.user_id)
    if (user.sub === createReservationDto.user_id)
      return this.reservationService.createReservation({
        start_time: new Date(start_time),
        end_time: new Date(end_time),
        date: new Date(date),
        ...rest,
      });
    throw new BadRequestException();
  }

  @Get('/:id')
  async getReservationById(
    @Param('id') id: number,
    @User() user: UserInfo,
  ): Promise<GetReservationResponseDto> {
    if (user.role === 'admin') {
      const reservation = await this.reservationService.getReservationById(id);
      if (!reservation) throw new NotFoundException();
    }
    const reservation = await this.reservationService.getReservationById(id);
    if (!reservation) throw new NotFoundException();
    if (reservation.user_id === user.sub) return reservation;
    throw new BadRequestException();
  }

  @Put('/:id')
  async updateReservation(
    @Param('id') id: number,
    @Body() updateReservationDto: UpdateReservationDto,
    @User() user: UserInfo,
  ): Promise<MessageResponseDto> {
    const { start_time, end_time, date, ...rest } = updateReservationDto;
    const reservation = await this.reservationService.getReservationById(id);
    if (!reservation) throw new NotFoundException();
    if (user.role === 'admin') {
      const result = await this.reservationService.updateReservation(id, {
        start_time: start_time ? new Date(start_time) : undefined,
        end_time: end_time ? new Date(end_time) : undefined,
        date: date ? new Date(date) : undefined,
        ...rest,
      });
      if (result) return { message: 'Reservation updated' };
    }
    if (reservation.user_id === user.sub || user.role === 'client') {
      const result = await this.reservationService.updateReservation(id, {
        start_time: start_time ? new Date(start_time) : undefined,
        end_time: end_time ? new Date(end_time) : undefined,
        date: date ? new Date(date) : undefined,
        ...rest,
      });
      if (result) return { message: 'Reservation updated' };
    }
    throw new BadRequestException();
  }

  @Delete('/:id')
  async deleteReservation(
    @Param('id') id: number,
    @User() user: UserInfo,
  ): Promise<MessageResponseDto> {
    if (user.role === 'admin') {
      const result = await this.reservationService.deleteReservation(id);
      if (result.rowCount) return { message: 'Reservation deleted' };
    }
    const reservation = await this.reservationService.getReservationById(id);
    if (!reservation) throw new NotFoundException();
    if (reservation.user_id === user.sub) {
      const result = await this.reservationService.deleteReservation(id);
      if (result.rowCount) return { message: 'Reservation deleted' };
    }
    throw new BadRequestException();
  }
}
