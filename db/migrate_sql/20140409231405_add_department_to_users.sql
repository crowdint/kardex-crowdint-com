ALTER TABLE "users" ADD COLUMN "department" character varying(255);
INSERT INTO schema_migrations (version) VALUES (20140409231405);
