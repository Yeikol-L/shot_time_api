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
} from '@nestjs/common';
import { CategoryService } from '../services/category.service';
import {
  CreateCategoryDto,
  CreateCategoryResponseDto,
  GetCategoryByIdDto,
  UpdateCategoryDto,
} from '../dtos/category.dto';
import { AuthGuard } from 'src/auth/auth.guard';
import { ApiBearerAuth } from '@nestjs/swagger';
import { User, UserInfo } from 'src/user.decorator';
import { MessageResponseDto } from 'src/dtos/auth.dto';
import { ServiceService } from 'src/services/service.service';
import { Category } from 'src/models/category.model';
import { Service } from 'src/models/service.model';


@ApiBearerAuth()
@UseGuards(AuthGuard)
@Controller('categories')
export class CategoryController {
  constructor(
    private readonly categoryService: CategoryService,
    private readonly serviceService: ServiceService,
  ) {}

  @Post()
  async createCategory(
    @Body() createCategoryDto: CreateCategoryDto,
    @User() user: UserInfo,
  ): Promise<CreateCategoryResponseDto> {
    if (user.role === 'admin')
      return this.categoryService.createCategory(createCategoryDto);
    throw new UnauthorizedException();
  }
  @Get('/all')
  async getCategories(): Promise<{ results: Category[] }> {
    return { results: await this.categoryService.getAllCategories() };
  }

  @Get('/:id')
  async getCategoryById(@Param('id') id: number): Promise<GetCategoryByIdDto> {
    const category = await this.categoryService.getCategoryById(id);
    if (!category) throw new UnauthorizedException();
    return category;
  }

  @Put('/:id')
  async updateCategory(
    @Param('id') id: number,
    @Body() updateCategoryDto: UpdateCategoryDto,
    @User() user: UserInfo,
  ): Promise<MessageResponseDto> {
    if (user.role !== 'admin') throw new UnauthorizedException();
    const result = await this.categoryService.updateCategory(
      id,
      updateCategoryDto,
    );
    if (!result) throw new UnauthorizedException();
    return { message: 'Category updated successfully' };
  }

  @Delete('/:id')
  async deleteCategory(
    @Param('id') id: number,
    @User() user: UserInfo,
  ): Promise<MessageResponseDto> {
    if (user.role !== 'admin') throw new UnauthorizedException();
    await this.categoryService.deleteCategory(id);
    return { message: 'Category deleted successfully' };
  }
}
