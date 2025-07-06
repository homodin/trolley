BEGIN;


--
-- MIGRATION VERSION FOR trolley
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('trolley', '20250619033922294', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250619033922294', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
