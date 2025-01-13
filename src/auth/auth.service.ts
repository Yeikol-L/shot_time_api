// filepath: src/auth/auth.service.ts
import { Injectable, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { UserService } from '../services/user.service';
import * as bcrypt from 'bcrypt';
import { User } from '../models/user.model';
import { LoginDto } from 'src/dtos/auth.dto';

@Injectable()
export class AuthService {
  constructor(
    private readonly userService: UserService,
    private readonly jwtService: JwtService,
  ) {}

  async validateUser(email: string, pass: string): Promise<Omit<User, 'password_hash'>> {
    const user = await this.userService.findUserByProperties({ email });
    if (user.length > 0 && bcrypt.compareSync(pass, user[0].password_hash)) {
      const { password_hash, ...result } = user[0];
      return result;
    }
    throw new UnauthorizedException();
  }

  async login(creadentials: LoginDto) {
    const user = await this.validateUser(creadentials.email, creadentials.password);
    const payload = { email: user.email, sub: user.id, role: user.role };
    return {
      access_token: this.jwtService.sign(payload),
    };
  }

  async register(user: Omit<User, 'id' | 'created_at'>) {
    const hashedPassword = bcrypt.hashSync(user.password_hash, 10);
    const newUser = await this.userService.createUser({
      ...user,
      password_hash: hashedPassword,
    });
    return newUser;
  }
}
