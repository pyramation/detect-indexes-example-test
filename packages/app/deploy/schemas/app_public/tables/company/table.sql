-- Deploy schemas/app_public/tables/company/table to pg

-- requires: schemas/app_public/schema

BEGIN;

CREATE TABLE app_public.company (
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4 (),
    name text UNIQUE NOT NULL
);

COMMIT;
