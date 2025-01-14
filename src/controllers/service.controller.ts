import { Controller, Post, Body, Get, Param, Put, Delete, UseGuards } from '@nestjs/common';
import { ServiceService } from '../services/service.service';
import { CreateServiceDto, UpdateServiceDto, DeleteServiceDto } from '../dtos/service.dto';
import { Service } from '../models/service.model';
import { ApiBearerAuth } from '@nestjs/swagger';
import { AuthGuard } from 'src/auth/auth.guard';


@ApiBearerAuth()
@UseGuards(AuthGuard)
@Controller('services')
export class ServiceController {
  constructor(private readonly serviceService: ServiceService) { }

  @Post()
  async createService(@Body() createServiceDto: CreateServiceDto): Promise<Service> {
    return this.serviceService.createService(createServiceDto);
  }

  @Get(':id')
  async getServiceById(@Param('id') id: number): Promise<Service | null> {
    return this.serviceService.getServiceById(id);
  }

  @Put(':id')
  async updateService(@Param('id') id: number, @Body() updateServiceDto: UpdateServiceDto): Promise<Service | null> {
    return this.serviceService.updateService(id, updateServiceDto);
  }

  @Delete(':id')
  async deleteService(@Param('id') id: number): Promise<void> {
    return this.serviceService.deleteService(id);
  }
}
