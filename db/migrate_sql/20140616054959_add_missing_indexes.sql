CREATE  INDEX  "index_achievables_users_on_user_id_and_achievable_id" ON "achievables_users"  ("user_id", "achievable_id");
CREATE  INDEX  "index_achievables_users_on_user_id_and_badge_id" ON "achievables_users"  ("user_id", "badge_id");
CREATE  INDEX  "index_achievables_users_on_user_id_and_workshop_id" ON "achievables_users"  ("user_id", "workshop_id");
CREATE  INDEX  "index_achievables_users_on_achievable_id_and_user_id" ON "achievables_users"  ("achievable_id", "user_id");
CREATE  INDEX  "index_skills_users_on_user_id_and_skill_id" ON "skills_users"  ("user_id", "skill_id");
CREATE  INDEX  "index_skills_users_on_skill_id_and_user_id" ON "skills_users"  ("skill_id", "user_id");
CREATE  INDEX  "index_achievables_on_id_and_type" ON "achievables"  ("id", "type");
INSERT INTO schema_migrations (version) VALUES (20140616054959);
