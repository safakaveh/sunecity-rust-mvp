CREATE TABLE geo_time_token.token_owner (
	id bigserial NOT NULL,
	id_user bigint NULL,
	subkey_user_count_limit smallint DEFAULT 1 NULL,
	parrent_must_be_accepted boolean DEFAULT false NULL,
	"key" varchar NULL,
	CONSTRAINT token_owner_pk PRIMARY KEY (id)
);
