-- Verify schemas/app_public/tables/review/table on pg

BEGIN;

SELECT verify_table ('app_public.review');

ROLLBACK;
