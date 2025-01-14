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
  unique,
} from 'drizzle-orm/pg-core';

export const roleEnum = pgEnum('user_role', ['client', 'user', 'admin']);

export const usersTable = pgTable('users', {
  id: integer().primaryKey().generatedAlwaysAsIdentity(),
  role: roleEnum(),
  name: varchar({ length: 100 }).notNull(),
  email: varchar({ length: 100 }).notNull().unique(),
  password_hash: text().notNull(),
  profile_picture: text(),
  created_at: timestamp().notNull().defaultNow(),

  business_name: varchar({ length: 100 }),
  business_address: text(),
  phone_number: varchar({ length: 15 }),
});
export const userRelations = relations(usersTable, ({ many }) => ({
  services: many(servicesTable),
  comments: many(commentsTable),
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
    price: decimal({ precision: 10, scale: 2 }).notNull(),
    rating: decimal({ precision: 3, scale: 2 }),
    category_id: integer().references(() => categoriesTable.id),
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

export const availabilityTable = pgTable(
  'availability',
  {
    id: integer().primaryKey().generatedAlwaysAsIdentity(),
    service_id: integer().notNull().references(() => servicesTable.id),
    day: dayEnum(),
    start_time: timestamp().notNull(),
    end_time: timestamp().notNull(),
  },
  (table) => [
    { uniqueConstraint: unique('service_day').on(table.service_id, table.day) },
  ],
);



export const servicesRelations = relations(servicesTable, ({ one, many }) => ({
  user: one(usersTable, {
    fields: [servicesTable.id],
    references: [usersTable.id],
  }),
  comments: many(commentsTable),
  ratings: many(ratingsTable),
  category: one(categoriesTable, {
    fields: [servicesTable.category_id],
    references: [categoriesTable.id],
  }),
}));

export const commentsTable = pgTable('comments', {
  id: integer().primaryKey().generatedAlwaysAsIdentity(),
  user_id: integer().notNull().references(() => usersTable.id),
  service_id: integer().notNull().references(() => servicesTable.id),
  comment: text().notNull(),
  parentComment: integer(),
});

export const commentsRelations = relations(commentsTable, ({ one }) => ({
  user: one(usersTable, {
    fields: [commentsTable.user_id],
    references: [usersTable.id],
  }),
  service: one(servicesTable, {
    fields: [commentsTable.service_id],
    references: [servicesTable.id],
  }),
  parentComment: one(commentsTable, {
    fields: [commentsTable.parentComment],
    references: [commentsTable.id],
  }),
}));

export const ratingsTable = pgTable(
  'ratings',
  {
    id: integer().primaryKey().generatedAlwaysAsIdentity(),
    user_id: integer().notNull().references(() => usersTable.id),
    service_id: integer().notNull().references(() => servicesTable.id),
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
  status: reservationStatus(),
});
