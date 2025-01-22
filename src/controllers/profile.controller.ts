import {
  S3Client,
} from '@aws-sdk/client-s3';
import { Express } from 'express';
import { FileInterceptor } from '@nestjs/platform-express';
import {
  Controller,
  Post,
  UploadedFile,
  UseGuards,
  UseInterceptors,
} from '@nestjs/common';
import { ApiBearerAuth, ApiBody, ApiConsumes } from '@nestjs/swagger';
import { AuthGuard } from 'src/auth/auth.guard';
import { User, UserInfo } from 'src/user.decorator';
import { UploadProfilePictureDto } from 'src/dtos/profile.dto';
import { ProfileService } from 'src/services/profile.service';
import { MessageResponseDto } from 'src/dtos/auth.dto';

const s3 = new S3Client();
@ApiBearerAuth()
@UseGuards(AuthGuard)
@Controller('profile')
export class ProfileController {
  constructor(private readonly profileService: ProfileService) {}

  @Post('upload-profile-picture')
  @UseInterceptors(FileInterceptor('file', {fileFilter: (req,file,cb) => {
    if(file.mimetype !== 'image/jpeg' && file.mimetype !== 'image/png') {
      return cb(new Error('Only JPEG and PNG files are allowed'), false);
    }
    return cb(null,true);
  }}))
  @ApiConsumes('multipart/form-data')
  @ApiBody({
    description: 'Profile picture',
    type: UploadProfilePictureDto,
  })
  async uploadProfilePicture(
    @UploadedFile() file: Express.Multer.File,
    @User() user: UserInfo,
  ): Promise<MessageResponseDto> {
     await this.profileService.uploadProfilePicture(file, user.sub);
     return {
        message: 'Profile picture uploaded successfully',
     }
  }
}
