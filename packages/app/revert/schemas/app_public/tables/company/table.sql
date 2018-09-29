-- Revert schemas/app_public/tables/company/table from pg

BEGIN;

DROP TABLE app_public.company;

COMMIT;
