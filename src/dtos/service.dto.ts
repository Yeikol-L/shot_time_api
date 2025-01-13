import { createZodDto } from 'nestjs-zod';
import { createServiceSchema, updateServiceSchema, deleteServiceSchema } from '../schemas/service.schema';

export class CreateServiceDto extends createZodDto(createServiceSchema) {}
export class UpdateServiceDto extends createZodDto(updateServiceSchema) {}
export class DeleteServiceDto extends createZodDto(deleteServiceSchema) {}
