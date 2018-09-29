-- Verify schemas/app_public/tables/employee/table on pg

BEGIN;

SELECT verify_table ('app_public.employee');

ROLLBACK;
