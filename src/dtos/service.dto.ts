import { createZodDto } from 'nestjs-zod';
import { createServiceSchema, updateServiceSchema, deleteServiceSchema, createServiceSchemaResponse, getServiceSchemaByIdResponse, getAllServicesSchemaResponse } from '../schemas/service.schema';

export class CreateServiceDto extends createZodDto(createServiceSchema) {}
export class CreateServiceResponseDto extends createZodDto(createServiceSchemaResponse) {}
export class GetServiceByIdResponseDto extends createZodDto(getServiceSchemaByIdResponse) {}
export class GetAllServicesResponseDto extends createZodDto(getAllServicesSchemaResponse) {}
export class UpdateServiceDto extends createZodDto(updateServiceSchema) {}
export class DeleteServiceDto extends createZodDto(deleteServiceSchema) {}
