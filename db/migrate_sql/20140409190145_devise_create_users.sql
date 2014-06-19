CREATE TABLE "users" ("id" serial primary key, "name" character varying(255), "email" character varying(255) DEFAULT '' NOT NULL, "encrypted_password" character varying(255) DEFAULT '' NOT NULL, "reset_password_token" character varying(255), "reset_password_sent_at" timestamp, "remember_created_at" timestamp, "sign_in_count" integer DEFAULT 0 NOT NULL, "current_sign_in_at" timestamp, "last_sign_in_at" timestamp, "current_sign_in_ip" character varying(255), "last_sign_in_ip" character varying(255), "provider" character varying(255), "uid" character varying(255), "created_at" timestamp, "updated_at" timestamp) ;
CREATE UNIQUE INDEX  "index_users_on_email" ON "users"  ("email");
CREATE UNIQUE INDEX  "index_users_on_reset_password_token" ON "users"  ("reset_password_token");
INSERT INTO schema_migrations (version) VALUES (20140409190145);