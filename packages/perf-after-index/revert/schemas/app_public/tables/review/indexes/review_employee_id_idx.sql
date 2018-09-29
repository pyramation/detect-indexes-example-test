-- Revert schemas/app_public/tables/review/indexes/review_employee_id_idx from pg

BEGIN;

DROP INDEX app_public.review_employee_id_idx;

COMMIT;
