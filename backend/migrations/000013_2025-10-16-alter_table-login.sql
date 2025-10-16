-- CREATE INDEX login_id_password_idx ON geo_time_token.login (id_password);
-- CREATE INDEX login_id_user_idx ON geo_time_token.login (id_user);
ALTER TABLE geo_time_token.login ADD CONSTRAINT login_passwords_fk FOREIGN KEY (id_password) REFERENCES geo_time_token.passwords(id);
ALTER TABLE geo_time_token.login ADD CONSTRAINT login_users_fk FOREIGN KEY (id_user) REFERENCES geo_time_token.users(id);
