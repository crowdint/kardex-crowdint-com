CREATE TABLE "positions" ("id" serial primary key, "name" character varying(255), "description" character varying(255), "image_url" character varying(255)) ;
INSERT INTO schema_migrations (version) VALUES (20140530190336);
