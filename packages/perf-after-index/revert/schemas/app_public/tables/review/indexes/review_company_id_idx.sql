-- Revert schemas/app_public/tables/review/indexes/review_company_id_idx from pg

BEGIN;

DROP INDEX app_public.review_company_id_idx;

COMMIT;
