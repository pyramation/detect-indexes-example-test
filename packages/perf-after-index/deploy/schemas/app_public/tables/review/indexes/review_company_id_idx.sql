-- Deploy schemas/app_public/tables/review/indexes/review_company_id_idx to pg


BEGIN;

CREATE INDEX review_company_id_idx ON app_public.review (
 company_id
);

COMMIT;
