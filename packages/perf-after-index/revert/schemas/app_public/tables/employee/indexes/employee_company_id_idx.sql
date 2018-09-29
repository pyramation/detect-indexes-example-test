-- Revert schemas/app_public/tables/employee/indexes/employee_company_id_idx from pg

BEGIN;

DROP INDEX app_public.employee_company_id_idx;

COMMIT;
