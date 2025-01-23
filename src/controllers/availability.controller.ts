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
  NotFoundException,
} from '@nestjs/common';
import { AuthGuard } from 'src/auth/auth.guard';
import {
  ApiBearerAuth,
  ApiCreatedResponse,
  ApiOkResponse,
} from '@nestjs/swagger';
import { AvailabilityService } from 'src/services/availability.service';
import {
  AvailabilityDto,
  CreateAvailabilityDto,
  CreateAvailabilityResponseDto,
  GetAvailabilityByIdResponseDto,
  GetAvailabilityOfDateDto,
  UpdateAvailabilityDto,
} from 'src/dtos/availability.dto';
import { ServiceService } from 'src/services/service.service';
import { User, UserInfo } from 'src/user.decorator';
import { MessageResponseDto } from 'src/dtos/auth.dto';

@ApiBearerAuth()
@UseGuards(AuthGuard)
@Controller('avalability')
export class AvailabilityController {
  constructor(
    private readonly availabilityService: AvailabilityService,
    private readonly serviceService: ServiceService,
  ) {}

  @Post()
  async createAvailability(
    @Body() createAvailabilityDto: CreateAvailabilityDto,
    @User() user: UserInfo,
  ): Promise<CreateAvailabilityResponseDto> {
    if (user.role === 'admin') {
      const result = await this.availabilityService.createAvailability(
        createAvailabilityDto,
      );
      if (!result) throw new UnauthorizedException();
      return result;
    }

    if (user.sub !== createAvailabilityDto.user_id)
      throw new UnauthorizedException();
    return this.availabilityService.createAvailability(createAvailabilityDto);
  }
  @Post('/availability-of-date')
  async getAvailabilityOfDate(
    @Body() availabilityDto: GetAvailabilityOfDateDto,
    @User() user: UserInfo,
  ){
    const fecha =new Date(availabilityDto.date);
    fecha.setHours(0,0,0,0)
    const result = await this.availabilityService.getAvailabilityOfClient(availabilityDto.user_id, fecha, availabilityDto.duration);
    return result;
  }

  @Get('/:id')
  async getAvailabilityById(
    @Param('id') id: number,
    @User() user: UserInfo,
  ): Promise<GetAvailabilityByIdResponseDto> {
    const availability = await this.availabilityService.getAvailabilityById(id);
    if (!availability) throw new UnauthorizedException();
    const service = await this.serviceService.getServiceById(
      availability.user_id,
    );
    if (service?.client_id === user.sub) return availability;
    throw new UnauthorizedException();
  }

  @Put('/:id')
  async updateAvailabilityById(
    @Param('id') id: number,
    @Body() updateAvailabilityDto: UpdateAvailabilityDto,
    @User() user: UserInfo,
  ): Promise<MessageResponseDto> {
    const { opening_time, closing_time, ...rest } = updateAvailabilityDto;
    if (user.role === 'admin') {
      const result = await this.availabilityService.updateAvailability(id, {
        opening_time: opening_time ? new Date(opening_time) : undefined,
        closing_time: closing_time ? new Date(closing_time) : undefined,
        ...rest,
      });
      if (!result) throw new UnauthorizedException();
      return { message: 'Availability updated successfully' };
    }
    const availability = await this.availabilityService.getAvailabilityById(id);
    if (!availability) throw new NotFoundException();
    const service = await this.serviceService.getServiceById(
      availability.user_id,
    );
    if (service?.client_id === user.sub) {
      const result = this.availabilityService.updateAvailability(id, {
        opening_time: opening_time ? new Date(opening_time) : undefined,
        closing_time: closing_time ? new Date(closing_time) : undefined,
        ...rest,
      });
      if (!result) throw new UnauthorizedException();
      return { message: 'Availability updated successfully' };
    }
    throw new UnauthorizedException();
  }

  @Delete('/:id')
  async deleteAvailability(
    @Param('id') id: number,
    @User() user: UserInfo,
  ): Promise<MessageResponseDto> {
    if (user.role === 'admin') {
      await this.availabilityService.deleteAvailability(id);
      return { message: 'Availability deleted successfully' };
    }
    const availability = await this.availabilityService.getAvailabilityById(id);
    if (!availability) throw new NotFoundException();
    const service = await this.serviceService.getServiceById(
      availability.user_id,
    );
    if (service?.client_id !== user.sub) throw new UnauthorizedException();
    await this.availabilityService.deleteAvailability(id);
    return { message: 'Availability deleted successfully' };
  }
}
