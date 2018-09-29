-- Deploy schemas/app_public/tables/review/table to pg

-- requires: schemas/app_public/schema
-- requires: schemas/app_public/tables/company/table
-- requires: schemas/app_public/tables/employee/table

BEGIN;

CREATE TABLE app_public.review (
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4 (),
    rating int,
    notes text,
    company_id uuid NOT NULL REFERENCES app_public.company(id),
    employee_id uuid NOT NULL REFERENCES app_public.employee(id)
);

COMMIT;
