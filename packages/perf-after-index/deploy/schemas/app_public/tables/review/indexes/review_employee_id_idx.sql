-- Deploy schemas/app_public/tables/review/indexes/review_employee_id_idx to pg


BEGIN;

CREATE INDEX review_employee_id_idx ON app_public.review (
 employee_id
);

COMMIT;
