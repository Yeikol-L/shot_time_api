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
  Query,
  ParseIntPipe,
  UseInterceptors,
  UploadedFile,
} from '@nestjs/common';
import { ServiceService } from '../services/service.service';
import {
  CreateServiceDto,
  UpdateServiceDto,
  CreateServiceResponseDto,
  GetServiceByIdResponseDto,
  GetAllServicesResponseDto,
} from '../dtos/service.dto';
import { ApiBearerAuth, ApiBody, ApiConsumes } from '@nestjs/swagger';
import { AuthGuard } from 'src/auth/auth.guard';
import { User, UserInfo } from 'src/user.decorator';
import { MessageResponseDto } from 'src/dtos/auth.dto';
import { FileInterceptor } from '@nestjs/platform-express';
import { UploadProfilePictureDto } from 'src/dtos/profile.dto';

@ApiBearerAuth()
@UseGuards(AuthGuard)
@Controller('services')
export class ServiceController {
  constructor(private readonly serviceService: ServiceService) {

  }
  @Post()
  async createService(
    @Body() createServiceDto: CreateServiceDto,
    @User() user: UserInfo,
  ): Promise<CreateServiceResponseDto> {
    if (user.role !== 'client') throw new UnauthorizedException();
    if (user.sub !== createServiceDto.client_id)
      throw new BadRequestException();
    return this.serviceService.createService(createServiceDto);
  }
  @Get('/all')
  async getAllServices(
    @Query('client_id', ParseIntPipe) client_id: number,
  ): Promise<GetAllServicesResponseDto> {
    return {
      results: await this.serviceService.getAllServices(client_id),
    };
  }

  @Get('/:id')
  async getServiceById(
    @Param('id') id: number,
  ): Promise<GetServiceByIdResponseDto> {
    const service = await this.serviceService.getServiceById(id);
    if (!service) throw new NotFoundException();
    return service;
  }


  @Put('/:id')
  async updateService(
    @Param('id') id: number,
    @Body() updateServiceDto: UpdateServiceDto,
    @User() user: UserInfo,
  ): Promise<MessageResponseDto> {
    if (user.role !== 'client') throw new UnauthorizedException();
    if (user.sub !== updateServiceDto.client_id)
      throw new BadRequestException();
    const result = await this.serviceService.updateService(
      id,
      updateServiceDto,
    );
    if (!result) throw new NotFoundException();
    return {
      message: 'Service updated successfully',
    };
  }
  @Post('/:id/upload-image')
  @UseInterceptors(FileInterceptor('file'))
  @ApiConsumes('multipart/form-data')
  @ApiBody({
    description: 'Service picture',
    type: UploadProfilePictureDto
  })
  async uploadImage(
    @Param('id') id: number,
    @UploadedFile() file: Express.Multer.File,
    @User() user: UserInfo,
  ): Promise<MessageResponseDto> {
    if (user.role !== 'client') throw new UnauthorizedException();
    const service = await this.serviceService.getServiceById(id);
    if (!service) throw new NotFoundException();
    if (user.sub !== service.client_id) throw new BadRequestException();
    await this.serviceService.uploadServicePicture(file,id);
    return {
      message: 'Image uploaded successfully',
    };
  }

  @Delete('/:id')
  async deleteService(
    @Param('id') id: number,
    @User() user: UserInfo,
  ): Promise<MessageResponseDto> {
    if (user.role !== 'client') throw new UnauthorizedException();
    const service = await this.serviceService.getServiceById(id);
    if (!service) throw new BadRequestException();
    if (user.sub !== service.client_id) throw new BadRequestException();
    await this.serviceService.deleteService(id);
    return {
      message: 'Service deleted successfully',
    };
  }
}
