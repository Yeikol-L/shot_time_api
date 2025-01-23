import { createZodDto } from 'nestjs-zod';
import { availabilitySchema, createAvailabilityResponseSchema, createAvailabilitySchema, getAvailabilityByIdResponseSchema, getAvailabilityOfDateSchema, updateAvailabilitySchema } from '../schemas/availability.schema';
export class GetAvailabilityByIdResponseDto extends createZodDto(getAvailabilityByIdResponseSchema) { }
export class AvailabilityDto extends createZodDto(availabilitySchema) { }
export class GetAvailabilityOfDateDto extends createZodDto(getAvailabilityOfDateSchema) { }
export class CreateAvailabilityResponseDto extends createZodDto(createAvailabilityResponseSchema) { }
export class CreateAvailabilityDto extends createZodDto(createAvailabilitySchema) { }
export class UpdateAvailabilityDto extends createZodDto(updateAvailabilitySchema) { }
