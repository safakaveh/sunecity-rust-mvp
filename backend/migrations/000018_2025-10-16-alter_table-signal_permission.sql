CREATE INDEX signal_permission_id_token_owner_idx ON geo_time_token.signal_permission (id_token_owner);
ALTER TABLE geo_time_token.signal_permission ADD CONSTRAINT signal_permission_token_owner_fk FOREIGN KEY (id_token_owner) REFERENCES geo_time_token.token_owner(id);
