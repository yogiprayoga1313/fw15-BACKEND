-- Active: 1680753894315@@127.0.0.1@5432@postgres@public
CREATE TABLE "users" (
    "id" INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "email" VARCHAR(255) UNIQUE,
    "password" VARCHAR(255),
    "createdAt" TIMESTAMP DEFAULT NOW(),
    "updateAt" TIMESTAMP DEFAULT NULL
);

INSERT INTO "users" ("email", "password") VALUES ('admin@gmail.com', '1234');

INSERT INTO "users" ("email", "password") VALUES ('fazztrack@gmail.com', '1234');

INSERT INTO "users" ("email", "password") VALUES ('yogi@gmail.com', '5432');


UPDATE "users" SET "email"='user@gmail.com' WHERE "id"=1;

DELETE FROM "users" WHERE "id"=2;
