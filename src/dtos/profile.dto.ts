import { ApiProperty } from "@nestjs/swagger";

export class UploadProfilePictureDto {
    @ApiProperty({ type: 'string', format: 'binary' })
    file: Express.Multer.File;
}