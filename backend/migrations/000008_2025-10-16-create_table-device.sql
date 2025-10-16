CREATE TABLE geo_time_token.device (
	id bigserial NOT NULL,
	id_user bigint NULL,
	"uuid" uuid NOT NULL,
	"name" varchar NULL,
	json_style jsonb NOT NULL,
	description varchar NULL,
	CONSTRAINT device_pk PRIMARY KEY (id)
);
