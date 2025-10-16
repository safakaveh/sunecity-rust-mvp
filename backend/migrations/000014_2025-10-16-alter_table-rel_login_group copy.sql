CREATE INDEX rel_login_group_id_login_idx ON geo_time_token.rel_login_group (id_login);
CREATE INDEX rel_login_group_id_group_idx ON geo_time_token.rel_login_group (id_group);
ALTER TABLE geo_time_token.rel_login_group ADD CONSTRAINT rel_login_group_login_fk FOREIGN KEY (id_login) REFERENCES geo_time_token.login(id);
ALTER TABLE geo_time_token.rel_login_group ADD CONSTRAINT rel_login_group_groups_fk FOREIGN KEY (id_group) REFERENCES geo_time_token."groups"(id);
