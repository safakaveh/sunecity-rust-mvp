CREATE TABLE geo_time_token.rel_login_group (
	id bigserial NOT NULL,
	id_login bigint NULL,
	id_group bigint NULL,
	CONSTRAINT rel_login_group_pk PRIMARY KEY (id)
);
