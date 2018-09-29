-- Verify schemas/app_public/tables/review/indexes/review_employee_id_idx  on pg

BEGIN;

SELECT verify_index ('app_public.review', 'review_employee_id_idx');

ROLLBACK;
