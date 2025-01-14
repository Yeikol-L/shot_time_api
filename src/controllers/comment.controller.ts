import { Controller, Post, Body, Get, Param, Put, Delete, UseGuards } from '@nestjs/common';
import { CommentService } from '../services/comment.service';
import { CreateCommentDto, UpdateCommentDto, DeleteCommentDto } from '../dtos/comment.dto';
import { Comment } from '../models/comment.model';
import { ApiBearerAuth } from '@nestjs/swagger';
import { AuthGuard } from 'src/auth/auth.guard';

@ApiBearerAuth()
@UseGuards(AuthGuard)
@Controller('comments')
export class CommentController {
  constructor(private readonly commentService: CommentService) { }

  @Post()
  async createComment(@Body() createCommentDto: CreateCommentDto): Promise<Comment> {
    return this.commentService.createComment(createCommentDto);
  }

  @Get(':id')
  async getCommentById(@Param('id') id: number): Promise<Comment | null> {
    return this.commentService.getCommentById(id);
  }

  @Put(':id')
  async updateComment(@Param('id') id: number, @Body() updateCommentDto: UpdateCommentDto): Promise<Comment | null> {
    return this.commentService.updateComment(id, updateCommentDto);
  }

  @Delete(':id')
  async deleteComment(@Param('id') id: number): Promise<void> {
    return this.commentService.deleteComment(id);
  }
}
