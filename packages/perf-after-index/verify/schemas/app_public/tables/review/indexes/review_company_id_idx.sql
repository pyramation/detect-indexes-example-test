-- Verify schemas/app_public/tables/review/indexes/review_company_id_idx  on pg

BEGIN;

SELECT verify_index ('app_public.review', 'review_company_id_idx');

ROLLBACK;
