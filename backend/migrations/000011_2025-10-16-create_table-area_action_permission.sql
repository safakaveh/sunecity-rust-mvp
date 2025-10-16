CREATE TABLE geo_time_token.area_action_permission (
	id bigserial NOT NULL,
	id_token_owner bigint NULL,
	"action" varchar NULL,
	"permission" boolean NULL,
	description varchar NULL,
	CONSTRAINT area_action_permission_pk PRIMARY KEY (id)
);
