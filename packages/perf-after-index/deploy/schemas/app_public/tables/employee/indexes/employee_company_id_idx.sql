-- Deploy schemas/app_public/tables/employee/indexes/employee_company_id_idx to pg


BEGIN;

CREATE INDEX employee_company_id_idx ON app_public.employee (
 company_id
);

COMMIT;
