CREATE TABLE "achievables" ("id" serial primary key, "name" character varying(255), "description" text, "type" character varying(255), "created_at" timestamp, "updated_at" timestamp) ;
INSERT INTO schema_migrations (version) VALUES (20140409185730);
