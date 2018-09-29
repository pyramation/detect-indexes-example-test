-- Revert schemas/app_public/tables/review/table from pg

BEGIN;

DROP TABLE app_public.review;

COMMIT;
