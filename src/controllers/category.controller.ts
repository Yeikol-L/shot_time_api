import { Controller, Post, Body, Get, Param, Put, Delete, UseGuards } from '@nestjs/common';
import { CategoryService } from '../services/categoryService';
import { CreateCategoryDto, UpdateCategoryDto, DeleteCategoryDto } from '../dtos/category.dto';
import { Category } from '../models/category.model';
import { AuthGuard } from 'src/auth/auth.guard';
import { ApiBearerAuth } from '@nestjs/swagger';

@ApiBearerAuth()
@UseGuards(AuthGuard)
@Controller('categories')
export class CategoryController {
  constructor(private readonly categoryService: CategoryService) {}

  @Post()
  async createCategory(@Body() createCategoryDto: CreateCategoryDto): Promise<Category> {
    return this.categoryService.createCategory(createCategoryDto);
  }

  @Get(':id')
  async getCategoryById(@Param('id') id: number): Promise<Category | null> {
    return this.categoryService.getCategoryById(id);
  }

  @Put(':id')
  async updateCategory(@Param('id') id: number, @Body() updateCategoryDto: UpdateCategoryDto): Promise<Category | null> {
    return this.categoryService.updateCategory(id, updateCategoryDto);
  }

  @Delete(':id')
  async deleteCategory(@Param('id') id: number): Promise<void> {
    return this.categoryService.deleteCategory(id);
  }
}
