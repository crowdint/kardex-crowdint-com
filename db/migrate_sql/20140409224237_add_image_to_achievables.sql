ALTER TABLE "achievables" ADD COLUMN "image" character varying(255);
INSERT INTO schema_migrations (version) VALUES (20140409224237);
