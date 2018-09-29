\echo Use "CREATE EXTENSION perf-after-index" to load this file. \quit
CREATE INDEX employee_company_id_idx ON app_public.employee ( company_id );

CREATE INDEX review_company_id_idx ON app_public.review ( company_id );

CREATE INDEX review_employee_id_idx ON app_public.review ( employee_id );