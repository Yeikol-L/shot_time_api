import { Injectable } from '@nestjs/common';
import { UserService } from './user.service';
import { PutObjectCommandInput, S3Client } from '@aws-sdk/client-s3';
import { Upload } from '@aws-sdk/lib-storage';

@Injectable()
export class ProfileService {
  private readonly s3: S3Client;
  constructor(private readonly userService: UserService) {
    this.s3 = new S3Client({
      credentials: {
        accessKeyId: process.env.AWS_ACCESS_KEY_ID as string,
        secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY as string,
      }
    });
  }
  async uploadProfilePicture(
    file: Express.Multer.File,
    userId: number,
  ): Promise<void> {
    try {
      const params: PutObjectCommandInput = {
        Bucket: "short-time-api",
        Key: "",
        ContentType: file.mimetype,
        Body: file.buffer,
      };
      // create arandom name
      const randomName = `${Math.random().toString(36).substring(2, 15) + Math.random().toString(36).substring(2, 15)}`;
      // create a new name for the file
      const newFileName = `${randomName}.${file.originalname.split('.').pop()}`;
      params.Key = newFileName;

      const upload = new Upload({
        params,
        client: this.s3,
      });
      const result = await upload.done();
      await this.userService.updateUser(userId, {
        profile_picture: result.Location,
      });
    } catch (error) {
      console.error(error);
    }
  }
}
