import {
  CanActivate,
  ExecutionContext,
  Injectable,
  UnauthorizedException,
} from '@nestjs/common';
import { Request } from 'express';

@Injectable()
export class AdminGuard implements CanActivate {
  constructor() { }

  async canActivate(context: ExecutionContext): Promise<boolean> {
    const request = context.switchToHttp().getRequest();
    const user = request['user'];
    if (!user || user.role !== 'admin')
      throw new UnauthorizedException();
    return true;
  }

  private extractTokenFromHeader(request: Request): string | undefined {
    console.log(request.headers.bearer);
    console.log(request.headers.authorization);
    if (request.headers.bearer) {
      return request.headers.bearer as string;
    } else {
      const [type, token] = request.headers.authorization?.split(' ') ?? [];
      return type === 'Bearer' ? token : undefined;
    }
  }
}

