-- Revert schemas/app_public/tables/employee/table from pg

BEGIN;

DROP TABLE app_public.employee;

COMMIT;
