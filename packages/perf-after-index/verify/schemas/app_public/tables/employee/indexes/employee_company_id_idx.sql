-- Verify schemas/app_public/tables/employee/indexes/employee_company_id_idx  on pg

BEGIN;

SELECT verify_index ('app_public.employee', 'employee_company_id_idx');

ROLLBACK;
