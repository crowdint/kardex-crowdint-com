ALTER TABLE "users" ADD COLUMN "is_admin" boolean;
INSERT INTO schema_migrations (version) VALUES (20140409222924);
