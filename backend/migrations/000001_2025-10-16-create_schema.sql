CREATE SCHEMA geo_time_token AUTHORIZATION "admin";
CREATE TABLE geo_time_token.passwords (
	id bigserial NOT NULL,
	"password" varchar NULL,
	CONSTRAINT password_pk PRIMARY KEY (id)
);
CREATE TABLE geo_time_token."groups" (
	id bigserial NOT NULL,
	"name" varchar NOT NULL,
	description varchar NULL,
	CONSTRAINT groups_pk PRIMARY KEY (id),
	CONSTRAINT groups_unique UNIQUE ("name")
);
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
CREATE TABLE geo_time_token.login (
	id bigserial NOT NULL,
	id_password bigint NULL,
	id_user bigint NOT NULL,
	active boolean DEFAULT true NULL,
	CONSTRAINT login_pk PRIMARY KEY (id),
	CONSTRAINT login_unique_id_password UNIQUE (id_password),
	CONSTRAINT login_unique_id_user UNIQUE (id_user)
);
CREATE TABLE geo_time_token.rel_login_group (
	id bigserial NOT NULL,
	id_login bigint NULL,
	id_group bigint NULL,
	CONSTRAINT rel_login_group_pk PRIMARY KEY (id)
);
CREATE TABLE geo_time_token.sunecity_token (
	id bigserial NOT NULL,
	"uuid" uuid NOT NULL,
	id_parent bigint NULL,
	id_token_owner bigint NOT NULL,
	id_map bigint NOT NULL,
	id_time_window bigint NOT NULL,
	id_device bigint NULL,
	exception_message_location varchar NULL,
	exception_message_timewindows varchar NULL,
	area_action varchar NULL,
	signal_type varchar NULL,
	offline boolean DEFAULT true NULL,
	CONSTRAINT sunecity_token_pk PRIMARY KEY (id),
	CONSTRAINT sunecity_token_unique_uuid UNIQUE ("uuid"),
	CONSTRAINT sunecity_token_unique_device UNIQUE (id_device),
	CONSTRAINT sunecity_token_unique_id_map UNIQUE (id_map),
	CONSTRAINT sunecity_token_unique_id_ime_window UNIQUE (id_time_window)

);
CREATE TABLE geo_time_token.time_windows (
	id bigserial NOT NULL,
	"name" varchar NULL,
	corn_expression varchar NULL,
	description varchar NULL,
	CONSTRAINT time_windows_pk PRIMARY KEY (id)
);
CREATE TABLE geo_time_token.device (
	id bigserial NOT NULL,
	id_user bigint NULL,
	"uuid" uuid NOT NULL,
	"name" varchar NULL,
	json_style jsonb NOT NULL,
	description varchar NULL,
	CONSTRAINT device_pk PRIMARY KEY (id)
);
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
CREATE TABLE geo_time_token.token_owner (
	id bigserial NOT NULL,
	id_user bigint NULL,
	subkey_user_count_limit smallint DEFAULT 1 NULL,
	parrent_must_be_accepted boolean DEFAULT false NULL,
	"key" varchar NULL,
	CONSTRAINT token_owner_pk PRIMARY KEY (id)
);
CREATE TABLE geo_time_token.area_action_permission (
	id bigserial NOT NULL,
	id_token_owner bigint NULL,
	"action" varchar NULL,
	"permission" boolean NULL,
	description varchar NULL,
	CONSTRAINT area_action_permission_pk PRIMARY KEY (id)
);
CREATE TABLE geo_time_token.signal_permission (
	id bigserial NOT NULL,
	id_token_owner bigint NULL,
	signal varchar NULL,
	"permission" boolean NULL,
	description varchar NULL,
	CONSTRAINT signal_permission_pk PRIMARY KEY (id)
);
-- CREATE INDEX login_id_password_idx ON geo_time_token.login (id_password);
-- CREATE INDEX login_id_user_idx ON geo_time_token.login (id_user);
ALTER TABLE geo_time_token.login ADD CONSTRAINT login_passwords_fk FOREIGN KEY (id_password) REFERENCES geo_time_token.passwords(id);
ALTER TABLE geo_time_token.login ADD CONSTRAINT login_users_fk FOREIGN KEY (id_user) REFERENCES geo_time_token.users(id);
CREATE INDEX rel_login_group_id_login_idx ON geo_time_token.rel_login_group (id_login);
CREATE INDEX rel_login_group_id_group_idx ON geo_time_token.rel_login_group (id_group);
ALTER TABLE geo_time_token.rel_login_group ADD CONSTRAINT rel_login_group_login_fk FOREIGN KEY (id_login) REFERENCES geo_time_token.login(id);
ALTER TABLE geo_time_token.rel_login_group ADD CONSTRAINT rel_login_group_groups_fk FOREIGN KEY (id_group) REFERENCES geo_time_token."groups"(id);
-- CREATE INDEX sunecity_token_uuid_idx ON geo_time_token.sunecity_token ("uuid");
CREATE INDEX sunecity_token_id_token_owner_idx ON geo_time_token.sunecity_token (id_token_owner);
CREATE INDEX sunecity_token_id_parent_idx ON geo_time_token.sunecity_token (id_parent);
ALTER TABLE geo_time_token.sunecity_token ADD CONSTRAINT sunecity_token_token_owner_fk FOREIGN KEY (id_token_owner) REFERENCES geo_time_token.token_owner(id);
ALTER TABLE geo_time_token.sunecity_token ADD CONSTRAINT sunecity_token_sunecity_token_fk FOREIGN KEY (id_parent) REFERENCES geo_time_token.sunecity_token(id);
ALTER TABLE geo_time_token.sunecity_token ADD CONSTRAINT sunecity_token_device_fk FOREIGN KEY (id_device) REFERENCES geo_time_token.device(id);
ALTER TABLE geo_time_token.sunecity_token ADD CONSTRAINT sunecity_token_map_fk FOREIGN KEY (id_map) REFERENCES geo_time_token."map"(id);
ALTER TABLE geo_time_token.sunecity_token ADD CONSTRAINT sunecity_token_time_windows_fk FOREIGN KEY (id_time_window) REFERENCES geo_time_token.time_windows(id);
ALTER TABLE geo_time_token.token_owner ADD CONSTRAINT token_owner_users_fk FOREIGN KEY (id_user) REFERENCES geo_time_token.users(id);
CREATE INDEX token_owner_id_user_idx ON geo_time_token.token_owner (id_user);
CREATE INDEX area_action_permission_id_token_owner_idx ON geo_time_token.area_action_permission (id_token_owner);
ALTER TABLE geo_time_token.area_action_permission ADD CONSTRAINT area_action_permission_token_owner_fk FOREIGN KEY (id_token_owner) REFERENCES geo_time_token.token_owner(id);
CREATE INDEX signal_permission_id_token_owner_idx ON geo_time_token.signal_permission (id_token_owner);
ALTER TABLE geo_time_token.signal_permission ADD CONSTRAINT signal_permission_token_owner_fk FOREIGN KEY (id_token_owner) REFERENCES geo_time_token.token_owner(id);
