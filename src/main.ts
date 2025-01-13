import { NestFactory } from '@nestjs/core';
import { SwaggerModule, DocumentBuilder, ApiBearerAuth } from '@nestjs/swagger';
import { AppModule } from './app.module';
import { ValidationPipe } from '@nestjs/common';
import { patchNestJsSwagger, ZodValidationPipe } from 'nestjs-zod';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
    app.useGlobalPipes(new ZodValidationPipe());
    app.useGlobalPipes(new ValidationPipe());
    patchNestJsSwagger()
  const config = new DocumentBuilder()
    .setTitle('Short Time API')
    .setDescription('')
    .setVersion('1.0')
    .addBearerAuth()
  // Setup Swagger Authorization Header for jwt
  config.addSecurity('bearer', {
    type: 'http',
    scheme: 'bearer',
  });
    const documentFactory = () => SwaggerModule.createDocument(app, config.build());
  SwaggerModule.setup('api', app, documentFactory);
  await app.listen(process.env.PORT ?? 3000);

}
bootstrap();
