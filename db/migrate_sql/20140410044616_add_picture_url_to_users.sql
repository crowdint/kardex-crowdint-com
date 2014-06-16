ALTER TABLE "users" ADD COLUMN "picture_url" character varying(255);
INSERT INTO schema_migrations (version) VALUES (20140410044616);
