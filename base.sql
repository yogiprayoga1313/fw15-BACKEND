-- Active: 1680753894315@@127.0.0.1@5432@postgres@public
CREATE TABLE "users" (
    "id" INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "fullName" VARCHAR (80),
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

ALTER TABLE "users" ADD COLUMN "name" VARCHAR(80);

DROP Table "users";

INSERT INTO "users" 
("fullName", "email", "password")
VALUES 
('test 1', 'test1@mail.com', '1234'),
('test 2', 'test2@mail.com', '1234'),
('test 2', 'test3@mail.com', '1234'),
('test 4', 'test4@mail.com', '1234'),
('test 5', 'test5@mail.com', '1234'),
('test 6', 'test6@mail.com', '1234');

SELECT * FROM "users" ORDER BY "fullName" ASC LIMIT 5 OFFSET 0;
