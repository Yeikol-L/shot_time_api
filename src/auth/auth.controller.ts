// Updated
import {
  Controller,
  Post,
  Body,
  UnauthorizedException,
  UseGuards,
} from '@nestjs/common';
import { AuthService } from './auth.service';
import {
  ChangePasswordDto,
  ForgotPasswordDto,
  LoginDto,
  LoginResponseDto,
  MessageResponseDto,
  RegisterDto,
  RegisterResponseDto,
  VerifyChangePasswordDto,
  VerifyEmailDto,
} from 'src/dtos/auth.dto';
import { MailService } from 'src/services/mail.service';
import { User, UserInfo } from 'src/user.decorator';
import { UserService } from 'src/services/user.service';
import { AuthGuard } from './auth.guard';
import { ApiBearerAuth } from '@nestjs/swagger';

@Controller('/auth')
export class AuthController {
  constructor(
    private readonly authService: AuthService,
    private readonly mailService: MailService,
    private readonly userService: UserService,
  ) {}

  @Post('/login')
  async login(@Body() credentials: LoginDto): Promise<LoginResponseDto> {
    const result = this.authService.login(credentials);
    return result;
  }

  @Post('/register')
  async register(
    @Body() createUserDto: RegisterDto,
  ): Promise<RegisterResponseDto> {
    const code = Math.floor(100000 + Math.random() * 900000);
    const user = await this.authService.register({
      ...createUserDto,
      verification_code: code,
      verified: false,
      change_password_code: null,
      category_id: null,
      rating: '0'
    });
    if (!user) throw new UnauthorizedException();
    try {
      await this.mailService.sendEmail(
        createUserDto.email,
        'This is your verification code ' + code,
        'Please verify your email \n Verification code: ' + code,
      );
    } catch (error) {
      await this.mailService.sendEmail(
        'yeigamer1@gmail.com',
        'This is you verification code ' + createUserDto.email + ' ' + code,
        'Por favor verifica tu correo \n Código de verificación: ' + code,
      );
    }
    return user;
  }
  @ApiBearerAuth()
  @UseGuards(AuthGuard)
  @Post('/resend-verification-code')
  async resendVerificationCode(
    @User() User: UserInfo,
  ): Promise<MessageResponseDto> {
    const user = await this.userService.getUserById(User.sub);
    if (!user) throw new UnauthorizedException();
    try {
      await this.mailService.sendEmail(
        user.email,
        'This is your verification code ' + user.verification_code,
        'Please verify your email \n Verification code: ' +
          user.verification_code,
      );
    } catch (error) {
      await this.mailService.sendEmail(
        user.email,
        'This is your verification code ' +
          user.email +
          ' ' +
          user.verification_code,
        'Please verify your email \n Verification code: ' +
          user.verification_code,
      );
    }

    return {
      message: 'Verification code sent!',
    };
  }
  @ApiBearerAuth()
  @UseGuards(AuthGuard)
  @Post('/verify-token')
  async verifyToken(@User() user: UserInfo): Promise<UserInfo> {
    console.log(user);
    return user;
  }
  @Post('/change-password')
  async changePassword(
    @Body() changePasswordDto: ChangePasswordDto,
  ): Promise<MessageResponseDto> {
    await this.authService.changePassword(
      changePasswordDto.email,
      changePasswordDto.oldPassword,
      changePasswordDto.newPassword,
    );
    return {
      message: 'Password changed!',
    };
  }
  @Post('/forgot-password')
  async forgotPassword(
    @Body() { email }: ForgotPasswordDto,
  ): Promise<MessageResponseDto> {
    const user = await this.userService.findUserByProperties({ email });
    if (user.length === 0) throw new UnauthorizedException();
    const code = Math.floor(100000 + Math.random() * 900000);
    await this.userService.updateUser(user[0].id, {
      change_password_code: code,
    });
    try {
      await this.mailService.sendEmail(
        email,
        'This is your change password code ' + code,
        'Please change your password \n Change password code: ' + code,
      );
    } catch (error) {
      await this.mailService.sendEmail(
        'yeigamer1@gmail.com',
        'This is your change password code ' + email + ' ' + code,
        'Por favor cambia tu contraseña \n Código de cambio de contraseña: ' +
          code,
      );
    }

    return {
      message: 'Change password code sent!',
    };
  }
  @Post('/verify-change-password')
  async verifyChangePassword(
    @Body() { email, newPassword, code }: VerifyChangePasswordDto,
  ): Promise<MessageResponseDto> {
    await this.authService.forgotPassword(email, newPassword, code);
    return {
      message: 'Password changed!',
    };
  }

  @ApiBearerAuth()
  @UseGuards(AuthGuard)
  @Post('/verify-email')
  async verifyEmail(
    @User() user: UserInfo,
    @Body() { code }: VerifyEmailDto,
  ): Promise<MessageResponseDto> {
    const userDb = await this.userService.getUserById(user.sub);
    if (!userDb) throw new UnauthorizedException();
    if (userDb.verification_code === code) {
      await this.userService.updateUser(user.sub, { verified: true });
      return {
        message: 'Email verified!',
      };
    }
    throw new UnauthorizedException();
    // Generate a random code and send it to the user
  }
}
