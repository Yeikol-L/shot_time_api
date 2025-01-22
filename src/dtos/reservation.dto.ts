import { createZodDto } from 'nestjs-zod';
import {
  createReservationSchema,
  updateReservationSchema,
  deleteReservationSchema,
  getReservationResultSchema,
  createReservationResponseSchema,
  searchReservationSchema,
} from '../schemas/reservation.schema';

export class CreateReservationDto extends createZodDto(
  createReservationSchema,
) {}
export class CreateReservationResponseDto extends createZodDto(
  createReservationResponseSchema,
) {}
export class UpdateReservationDto extends createZodDto(
  updateReservationSchema,
) {}

export class DeleteReservationDto extends createZodDto(
  deleteReservationSchema,
) {}

export class GetReservationResponseDto extends createZodDto(
  getReservationResultSchema,
) {}

export class SearchReservationResponseDto extends createZodDto(
  searchReservationSchema,
) {}