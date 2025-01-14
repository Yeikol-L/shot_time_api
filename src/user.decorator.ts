import { createParamDecorator, ExecutionContext } from '@nestjs/common';

export const User = createParamDecorator(
  (data: unknown, ctx: ExecutionContext) => {
    const request = ctx.switchToHttp().getRequest();
    return request.user;
  },
);
export type UserInfo = {
  sub: number;
  email: string;
  role: 'admin' | 'user' | 'client'
}
