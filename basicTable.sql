CREATE TABLE "users" (
    "id" INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "username" VARCHAR (255),
    "email" VARCHAR (255) UNIQUE,
    "password" VARCHAR (255),
    "createdAt" TIMESTAMP DEFAULT NOW(),
    "updateAt" TIMESTAMP DEFAULT NULL
);

CREATE TABLE "profile" (
    "id" INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "picture" VARCHAR(255),
    "fullName" VARCHAR(255),
    "phoneNumber" VARCHAR(255),
    "gender" BOOLEAN,
    "profession" VARCHAR(255),
    "nationality" VARCHAR(255),
    "birthDate" DATE,
    "createdAt" TIMESTAMP DEFAULT NOW(),
    "updateAt" TIMESTAMP DEFAULT NULL
);

CREATE TABLE "categories" (
    "id" INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "name" VARCHAR(255),
    "createdAt" TIMESTAMP DEFAULT NOW(),
    "updateAt" TIMESTAMP DEFAULT NULL
);

CREATE TABLE "citites" (
    "id" INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "picture" VARCHAR(255),
    "name" VARCHAR(255),
    "createdAt" TIMESTAMP DEFAULT NOW(),
    "updateAt" TIMESTAMP DEFAULT NULL
);

CREATE TABLE "events" (
    "id" INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "picture" VARCHAR(255),
    "title" VARCHAR(255),
    "date" DATE,
    "cityId" INTEGER,
    "descriptions" TEXT,
    "createdAt" TIMESTAMP DEFAULT NOW(),
    "updateAt" TIMESTAMP DEFAULT NULL
);

CREATE TABLE "eventCategories" (
    "id" INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "eventId" VARCHAR(255),
    "categoryId" INTEGER,
    "createdAt" TIMESTAMP DEFAULT NOW(),
    "updateAt" TIMESTAMP DEFAULT NULL
);

CREATE TABLE "partners" (
    "id" INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY, 
    "picture" VARCHAR(255),
    "name" VARCHAR(255),
    "createdAt" TIMESTAMP DEFAULT NOW(),
    "updateAt" TIMESTAMP DEFAULT NULL
);

CREATE TABLE "reservationSection" (
    "id" INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "name" VARCHAR(255),
    "price" VARCHAR(255),
    "createdAt" TIMESTAMP DEFAULT NOW(),
    "updateAt" TIMESTAMP DEFAULT NULL
);

CREATE TABLE "reservationStatus" (
    "id" INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "name"VARCHAR(255),
    "createdAt" TIMESTAMP DEFAULT NOW(),
    "updateAt" TIMESTAMP DEFAULT NULL
);

CREATE TABLE "paymentMethod" (
    "id" INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "name" VARCHAR(255),
    "createdAt" TIMESTAMP DEFAULT NOW(),
    "updateAt" TIMESTAMP DEFAULT NULL
);

CREATE TABLE "reservations" (
    "id" INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "eventId" INTEGER,
    "userId" INTEGER,
    "statusId" INTEGER,
    "paymentMethod" INTEGER,
    "createdAt" TIMESTAMP DEFAULT NOW(),
    "updateAt" TIMESTAMP DEFAULT NULL
);

CREATE TABLE "reservationTickets" (
    "id" INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "reservationId" INTEGER,
    "sectionId" INTEGER,
    "quantity" INTEGER,
    "createdAt" TIMESTAMP DEFAULT NOW(),
    "updateAt" TIMESTAMP DEFAULT NULL
);

CREATE TABLE "wishlist" (
    "id" INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "eventId" INTEGER,
    "userId" INTEGER,
    "createdAt" TIMESTAMP DEFAULT NOW(),
    "updateAt" TIMESTAMP DEFAULT NULL
);
