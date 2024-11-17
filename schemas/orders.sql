CREATE TABLE "public"."orders" (
  "id" int PRIMARY KEY,
  "user_id" varchar COMMENT 'faker.string.uuid()',
  "amount" int COMMENT 'faker.number.int({ min: 1, max: 200  })',
  "delivered" boolean COMMENT 'faker.datatype.boolean()',
  "created_at" timestamp COMMENT 'faker.date.past()'
);