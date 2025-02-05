// filepath: src/auth/auth.service.ts
import { BadRequestException, Injectable, UnauthorizedException } from '@nestjs/common';
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
  ) { }

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

  async register(user: Omit<User, 'id' | 'created_at'>): Promise<Omit<User, 'password_hash' | 'verification_code' | 'change_password_code' > | null> {
    const hashedPassword = bcrypt.hashSync(user.password_hash, 10);
    const newUser = await this.userService.createUser({
      ...user,
      password_hash: hashedPassword,
    });
    return newUser;
  }
  async changePassword(email: string, oldPass: string, newPass: string): Promise<void> {
    const validatedUser = await this.validateUser(email, oldPass);
    const newPassword = bcrypt.hashSync(newPass, 10);
    const updatedUser = await this.userService.updateUser(validatedUser.id, { password_hash: newPassword });
    if (updatedUser)
      return;
    throw new BadRequestException();
  }
  async forgotPassword(email: string, newPass: string, code: number): Promise<void> {
    const user = await this.userService.findUserByProperties({ email });
    if (user.length === 0) throw new UnauthorizedException();
    if (user[0].change_password_code !== code) throw new UnauthorizedException();
    const newPassword = bcrypt.hashSync(newPass, 10);
    await this.userService.updateUser(user[0].id, { password_hash: newPassword });
  }
}
