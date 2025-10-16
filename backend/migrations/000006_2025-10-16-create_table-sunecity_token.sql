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
