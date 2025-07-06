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
    "overrideded" text NOT NULL,
    "overrideCode" text NOT NULL,
    "hookInGoodCondition" text NOT NULL,
    "floorMeshInGoodCondition" text NOT NULL,
    "stillageIsInGeneralGoodCondition" text NOT NULL
);


--
-- MIGRATION VERSION FOR trolley
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('trolley', '20250613194158732', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250613194158732', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
