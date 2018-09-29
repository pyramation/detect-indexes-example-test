-- Deploy schemas/app_public/tables/employee/table to pg

-- requires: schemas/app_public/schema
-- requires: schemas/app_public/tables/company/table

BEGIN;

CREATE TABLE app_public.employee (
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4 (),
    name text,
    company_id uuid REFERENCES app_public.company(id)
);

COMMIT;
