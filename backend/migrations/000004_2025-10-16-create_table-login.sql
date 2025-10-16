CREATE TABLE geo_time_token.login (
	id bigserial NOT NULL,
	id_password bigint NULL,
	id_user bigint NOT NULL,
	active boolean DEFAULT true NULL,
	CONSTRAINT login_pk PRIMARY KEY (id),
	CONSTRAINT login_unique_id_password UNIQUE (id_password),
	CONSTRAINT login_unique_id_user UNIQUE (id_user)
);
