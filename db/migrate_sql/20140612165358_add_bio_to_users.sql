ALTER TABLE "users" ADD COLUMN "bio" text;
INSERT INTO schema_migrations (version) VALUES (20140612165358);
