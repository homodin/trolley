BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "transfer_log" CASCADE;

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
    "overrided" text NOT NULL,
    "overrideCode" text NOT NULL,
    "hookInGoodCondition" text NOT NULL,
    "floorMeshInGoodCondition" text NOT NULL,
    "stillageIsInGeneralGoodCondition" text NOT NULL,
    "remainingCycles" bigint NOT NULL
);


--
-- MIGRATION VERSION FOR trolley
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('trolley', '20250619033714536', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250619033714536', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
