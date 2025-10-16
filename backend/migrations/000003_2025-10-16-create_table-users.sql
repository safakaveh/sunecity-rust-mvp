CREATE TABLE geo_time_token.users (
	id bigserial NOT NULL,
	id_user bigint NULL,
	firstname varchar NULL,
	lastname varchar NULL,
	email varchar NULL,
	validated_email boolean NULL,
	cellphone varchar NULL,
	validated_cellphone varchar NULL,
	description varchar NULL,
	photo_external_id bigint NULL,
	CONSTRAINT users_pk PRIMARY KEY (id)
);
