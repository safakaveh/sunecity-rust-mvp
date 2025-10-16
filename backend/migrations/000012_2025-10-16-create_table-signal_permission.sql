CREATE TABLE geo_time_token.signal_permission (
	id bigserial NOT NULL,
	id_token_owner bigint NULL,
	signal varchar NULL,
	"permission" boolean NULL,
	description varchar NULL,
	CONSTRAINT signal_permission_pk PRIMARY KEY (id)
);
