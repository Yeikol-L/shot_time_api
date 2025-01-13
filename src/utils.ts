import { z } from 'zod';

export const decimalString = (precision: number, scale: number) =>
  z
    .string()
    .regex(new RegExp(`^\\d{1,${precision - scale}}(\\.\\d{1,${scale}})?$`), {
      message: `Invalid decimal format. Expected a number with up to ${precision - scale} digits before the decimal point and up to ${scale} digits after the decimal point.`,
    });
