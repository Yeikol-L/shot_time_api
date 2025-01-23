import { relations, sql } from 'drizzle-orm';
import {
  integer,
  pgTable,
  varchar,
  pgEnum,
  text,
  timestamp,
  decimal,
  check,
  boolean,
} from 'drizzle-orm/pg-core';

export const roleEnum = pgEnum('user_role', ['client', 'user', 'admin']);

export const usersTable = pgTable('users', {
  id: integer().primaryKey().generatedAlwaysAsIdentity(),
  role: roleEnum().notNull(),
  name: varchar({ length: 100 }).notNull(),
  email: varchar({ length: 100 }).notNull().unique(),
  password_hash: text().notNull(),
  profile_picture: text(),
  created_at: timestamp().notNull().defaultNow(),

  category_id: integer().references(() => categoriesTable.id),
  business_name: varchar({ length: 100 }),
  business_address: text(),
  phone_number: varchar({ length: 15 }),

  verification_code: integer(),
  change_password_code: integer(),
  verified: boolean().default(false).notNull(),
});
export const userRelations = relations(usersTable, ({ many, one }) => ({
  services: many(servicesTable),
  category: one(categoriesTable, {
    fields: [usersTable.category_id],
    references: [categoriesTable.id],
  })
}));

export const categoriesTable = pgTable('categories', {
  id: integer().primaryKey().generatedAlwaysAsIdentity(),
  name: varchar({ length: 100 }).notNull().unique(),
});

export const categoriesRelations = relations(categoriesTable, ({ many }) => ({
  services: many(servicesTable),
}));

export const dayEnum = pgEnum('day', [
  'monday',
  'tuesday',
  'wednesday',
  'thursday',
  'friday',
  'saturday',
  'sunday',
]);
export const servicesTable = pgTable(
  'services',
  {
    id: integer().primaryKey().generatedAlwaysAsIdentity(),
    client_id: integer().notNull(),
    name: varchar({ length: 100 }).notNull(),
    description: text(),
    picture: text(),
    price: decimal({ precision: 10, scale: 2 }).notNull(),
    rating: decimal({ precision: 3, scale: 2 }),
    service_duration: integer().notNull().default(30),
  },
  (table) => [
    {
      unique: check(
        'rating_check',
        sql`${table.rating} <= 5 AND ${table.rating} >= 0`,
      ),
    },
  ],
);

export const availabilityTable = pgTable('availability', {
  id: integer().primaryKey().generatedAlwaysAsIdentity(),
  user_id: integer().notNull().references(() => usersTable.id),
  day: dayEnum().notNull(), // Day of the week (recurring)
  opening_time: timestamp().notNull(),
  closing_time: timestamp().notNull(),
});

// export const noJobDaysTable = pgTable('no_job_days', {
//   id: integer().primaryKey().generatedAlwaysAsIdentity(),
//   service_id: integer().notNull().references(() => servicesTable.id),
//   date: timestamp().notNull().unique(), // Specific date
// });

export const servicesRelations = relations(servicesTable, ({ one, many }) => ({
  user: one(usersTable, {
    fields: [servicesTable.id],
    references: [usersTable.id],
  }),
  ratings: many(ratingsTable),
}));

export const ratingsTable = pgTable(
  'ratings',
  {
    id: integer().primaryKey().generatedAlwaysAsIdentity(),
    user_id: integer().notNull().references(() => usersTable.id),
    service_id: integer().notNull().references(() => servicesTable.id),
    reservation_id: integer().notNull().references(() => reservationsTable.id),
    comment: text().notNull(),
    response: text(),
    commentDate: timestamp().notNull().defaultNow(),
    responseDate: timestamp(),
    rating: decimal({ precision: 2, scale: 1 }).notNull(),
  },
  (table) => [
    {
      unique: check(
        'rating_check',
        sql`${table.rating} <= 5 AND ${table.rating} >= 0`,
      ),
    },
  ],
);
export const ratingsRelations = relations(ratingsTable, ({ one }) => ({
  user: one(usersTable, {
    fields: [ratingsTable.user_id],
    references: [usersTable.id],
  }),
  service: one(servicesTable, {
    fields: [ratingsTable.service_id],
    references: [servicesTable.id],
  }),
}));

export const reservationStatus = pgEnum('reservation_status', [
  'pending',
  'accepted',
  'rejected',
  'done',
  'canceled',
]);

export const reservationsTable = pgTable('reservations', {
  id: integer().primaryKey().generatedAlwaysAsIdentity(),
  user_id: integer().notNull().references(() => usersTable.id),
  service_id: integer().notNull().references(() => servicesTable.id),
  date: timestamp().notNull(),
  start_time: timestamp().notNull(),
  end_time: timestamp().notNull(),
  status: reservationStatus().notNull(),
});

export const reservationRelations = relations(reservationsTable, ({ one }) => ({
  user: one(usersTable, {
    fields: [reservationsTable.user_id],
    references: [usersTable.id],
  }),
  service: one(servicesTable, {
    fields: [reservationsTable.service_id],
    references: [servicesTable.id],
  }),
}));
