CREATE TABLE geo_time_token.time_windows (
	id bigserial NOT NULL,
	"name" varchar NULL,
	corn_expression varchar NULL,
	description varchar NULL,
	CONSTRAINT time_windows_pk PRIMARY KEY (id)
);
