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
  ParseIntPipe,
  Query,
} from '@nestjs/common';
import { UserService } from '../services/user.service';
import {
  CreateUserDto,
  CreateUserResponseDto,
  GetAllClientsResponseDto,
  GetUserByIdResponseDto,
  UpdateUserDto,
} from '../dtos/user.dto';
import { User } from '../models/user.model';
import { ApiBearerAuth } from '@nestjs/swagger';
import { AuthGuard } from 'src/auth/auth.guard';
import { AdminGuard } from 'src/auth/auth.admin.guard';
import { User as UserDecorator, UserInfo } from 'src/user.decorator';
import { MessageResponseDto } from 'src/dtos/auth.dto';

@ApiBearerAuth()
@UseGuards(AuthGuard)
@Controller('users')
export class UserController {
  constructor(private readonly userService: UserService) {}

  @UseGuards(AdminGuard)
  @Post()
  async createUser(
    @Body() createUserDto: CreateUserDto,
  ): Promise<CreateUserResponseDto> {
    const result = await this.userService.createUser(createUserDto);
    return result;
  }
  @Get('/clients')
  async getClients(): Promise<GetAllClientsResponseDto> {
      return {
        results: (await this.userService.findUserByProperties({
          role: 'client',
        })).map(u => {
          const {password_hash, verification_code, verified, change_password_code,...user} = u
          return user
        }),
      };
  }

  @Get('/:id')
  async getUserById(
    @Param('id', ParseIntPipe) id: number,
    @UserDecorator() user: UserInfo,
  ): Promise<GetUserByIdResponseDto> {
    if (user.sub !== id) {
      throw new UnauthorizedException();
    }
    const dbUser = await this.userService.getUserById(id);
    if (!dbUser) throw new UnauthorizedException();
    return dbUser;
  }



  @Put('/:id')
  async updateUser(
    @Param('id') id: number,
    @Body() updateUserDto: UpdateUserDto,
  ): Promise<MessageResponseDto> {
    const result = await this.userService.updateUser(id, updateUserDto);
    if (!result) throw new UnauthorizedException();
    return { message: 'User updated successfully' };
  }

  @Delete('/:id')
  async deleteUser(@Param('id') id: number): Promise<MessageResponseDto> {
    await this.userService.deleteUser(id);
    return { message: 'User deleted successfully' };
  }
}
