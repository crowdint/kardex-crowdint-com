ALTER TABLE "positions" ADD COLUMN "user_id" integer;
CREATE  INDEX  "index_positions_on_user_id" ON "positions"  ("user_id");
INSERT INTO schema_migrations (version) VALUES (20140530190420);
