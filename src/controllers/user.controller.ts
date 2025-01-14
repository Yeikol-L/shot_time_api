import { Controller, Post, Body, Get, Param, Put, Delete, UseGuards, UnauthorizedException, ParseIntPipe } from '@nestjs/common';
import { UserService } from '../services/user.service';
import { CreateUserDto, UpdateUserDto } from '../dtos/user.dto';
import { User } from '../models/user.model';
import { ApiBearerAuth } from '@nestjs/swagger';
import { AuthGuard } from 'src/auth/auth.guard';
import { AdminGuard } from 'src/auth/auth.admin.guard';
import { User as UserDecorator, UserInfo } from 'src/user.decorator';


@ApiBearerAuth()
@UseGuards(AuthGuard)
@Controller('users')
export class UserController {
  constructor(private readonly userService: UserService) { }

  @UseGuards(AdminGuard)
  @Post()
  async createUser(@Body() createUserDto: CreateUserDto): Promise<User> {
    return this.userService.createUser(createUserDto);
  }

  @Get(':id')
  async getUserById(@Param('id', ParseIntPipe) id: number, @UserDecorator() user: UserInfo): Promise<Omit<User, 'password_hash'> | null> {
    if (user.sub !== id) {
      console.log(user.sub)
      console.log(id)
      throw new UnauthorizedException();
    }
    return this.userService.getUserById(id);
  }

  @Put(':id')
  async updateUser(@Param('id') id: number, @Body() updateUserDto: UpdateUserDto): Promise<User | null> {
    return this.userService.updateUser(id, updateUserDto);
  }

  @Delete(':id')
  async deleteUser(@Param('id') id: number): Promise<void> {
    return this.userService.deleteUser(id);
  }
}
