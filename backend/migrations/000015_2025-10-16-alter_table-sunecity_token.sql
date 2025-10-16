-- CREATE INDEX sunecity_token_uuid_idx ON geo_time_token.sunecity_token ("uuid");
CREATE INDEX sunecity_token_id_token_owner_idx ON geo_time_token.sunecity_token (id_token_owner);
CREATE INDEX sunecity_token_id_parent_idx ON geo_time_token.sunecity_token (id_parent);
ALTER TABLE geo_time_token.sunecity_token ADD CONSTRAINT sunecity_token_token_owner_fk FOREIGN KEY (id_token_owner) REFERENCES geo_time_token.token_owner(id);
ALTER TABLE geo_time_token.sunecity_token ADD CONSTRAINT sunecity_token_sunecity_token_fk FOREIGN KEY (id_parent) REFERENCES geo_time_token.sunecity_token(id);
ALTER TABLE geo_time_token.sunecity_token ADD CONSTRAINT sunecity_token_device_fk FOREIGN KEY (id_device) REFERENCES geo_time_token.device(id);
ALTER TABLE geo_time_token.sunecity_token ADD CONSTRAINT sunecity_token_map_fk FOREIGN KEY (id_map) REFERENCES geo_time_token."map"(id);
ALTER TABLE geo_time_token.sunecity_token ADD CONSTRAINT sunecity_token_time_windows_fk FOREIGN KEY (id_time_window) REFERENCES geo_time_token.time_windows(id);
