\echo Use "CREATE EXTENSION app" to load this file. \quit
CREATE SCHEMA app_public;

CREATE TABLE app_public.company (
 	id uuid PRIMARY KEY DEFAULT ( uuid_generate_v4() ),
	name text UNIQUE NOT NULL 
);

CREATE TABLE app_public.employee (
 	id uuid PRIMARY KEY DEFAULT ( uuid_generate_v4() ),
	name text,
	company_id uuid REFERENCES app_public.company ( id ) 
);

CREATE TABLE app_public.review (
 	id uuid PRIMARY KEY DEFAULT ( uuid_generate_v4() ),
	rating int,
	notes text,
	company_id uuid NOT NULL REFERENCES app_public.company ( id ),
	employee_id uuid NOT NULL REFERENCES app_public.employee ( id ) 
);