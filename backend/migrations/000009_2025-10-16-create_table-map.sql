CREATE TABLE geo_time_token."map" (
	id bigserial NOT NULL,
	id_user bigint NOT NULL,
	"uuid" uuid NOT NULL,
	"name" varchar NOT NULL,
	json_style jsonb NULL,
	jeo_json public.geometry NOT NULL,
	description varchar NULL,
	CONSTRAINT map_pk PRIMARY KEY (id)
);
