BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "contents" (
    "id" bigserial PRIMARY KEY,
    "contentId" text NOT NULL,
    "partNumber" text NOT NULL,
    "quantity" bigint NOT NULL,
    "employeeName" text NOT NULL,
    "transactionDatetime" timestamp without time zone NOT NULL,
    "contentType" text NOT NULL,
    "reason" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "operator" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "opType" text NOT NULL,
    "clockNumber" text NOT NULL,
    "password" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "part_number" (
    "id" bigserial PRIMARY KEY,
    "partNumber" text NOT NULL,
    "description" text NOT NULL,
    "commonDescription" text NOT NULL,
    "pathToPic" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "stillage_master" (
    "id" bigserial PRIMARY KEY,
    "stillageNumber" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "transfer_log" (
    "id" bigserial PRIMARY KEY,
    "stillageNumber" text NOT NULL,
    "sourceWarehouse" text NOT NULL,
    "targetWarehouse" text NOT NULL,
    "transactionType" text NOT NULL,
    "contentId" text NOT NULL,
    "employeeName" text NOT NULL,
    "transactionDatetime" timestamp without time zone NOT NULL,
    "overrideAuth" text NOT NULL,
    "override" text NOT NULL,
    "overrideCode" text NOT NULL,
    "hookInGoodCondition" text NOT NULL,
    "floorMeshInGoodCondition" text NOT NULL,
    "stillageIsInGeneralGoodCondition" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "warehouses" (
    "id" bigserial PRIMARY KEY,
    "warehouse" text NOT NULL
);


--
-- MIGRATION VERSION FOR trolley
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('trolley', '20250613190402596', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250613190402596', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
