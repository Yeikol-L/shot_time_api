// import { Resource } from 'sst';
import { SESv2Client, SendEmailCommand } from '@aws-sdk/client-sesv2';
import { Injectable } from '@nestjs/common';


@Injectable()
export class MailService {
    private readonly client: SESv2Client;
    constructor() {
        this.client = new SESv2Client({
            credentials: {
                accessKeyId: process.env.AWS_ACCESS_KEY_ID as string,
                secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY as string,
            },
        });
    }
  async sendEmail(to: string, subject: string, body: string) {
        await this.client.send(
          new SendEmailCommand({
            FromEmailAddress: 'authentication@short-time.anmysoft.net',
            Destination: {
              ToAddresses: [to],
            },
            Content: {
              Simple: {
                Subject: {
                  Data: subject,
                },
                Body: {
                  Text: {
                    Data: body,
                  },
                },
              },
            },
          })
        );
      
        return {
          statusCode: 200,
          body: "Sent!"
        };
  }
}
