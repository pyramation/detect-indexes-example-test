-- Verify schemas/app_public/tables/company/table on pg

BEGIN;

SELECT verify_table ('app_public.company');

ROLLBACK;
