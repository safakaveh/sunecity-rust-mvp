CREATE TABLE geo_time_token."groups" (
	id bigserial NOT NULL,
	"name" varchar NOT NULL,
	description varchar NULL,
	CONSTRAINT groups_pk PRIMARY KEY (id),
	CONSTRAINT groups_unique UNIQUE ("name")
);
