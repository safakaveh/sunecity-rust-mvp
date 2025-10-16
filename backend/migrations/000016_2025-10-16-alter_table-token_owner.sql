ALTER TABLE geo_time_token.token_owner ADD CONSTRAINT token_owner_users_fk FOREIGN KEY (id_user) REFERENCES geo_time_token.users(id);
CREATE INDEX token_owner_id_user_idx ON geo_time_token.token_owner (id_user);
