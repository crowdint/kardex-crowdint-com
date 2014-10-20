# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141020164942) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "badge_users", force: true do |t|
    t.integer  "badge_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "badges_engine_awards", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "badges_engine_badges", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "award_id"
    t.integer  "value_id"
  end

  add_index "badges_engine_badges", ["award_id"], name: "index_badges_engine_badges_on_award_id", using: :btree
  add_index "badges_engine_badges", ["value_id"], name: "index_badges_engine_badges_on_value_id", using: :btree

  create_table "badges_engine_levels", force: true do |t|
    t.string   "tier"
    t.text     "description"
    t.integer  "badge_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "badge_alias"
  end

  create_table "badges_engine_values", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nominee_lists", force: true do |t|
    t.integer  "badge_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nominee_lists", ["badge_id"], name: "index_nominee_lists_on_badge_id", using: :btree

  create_table "nominee_lists_users", id: false, force: true do |t|
    t.integer "nominee_list_id", null: false
    t.integer "user_id",         null: false
  end

  add_index "nominee_lists_users", ["nominee_list_id", "user_id"], name: "index_nominee_lists_users_on_nominee_list_id_and_user_id", using: :btree
  add_index "nominee_lists_users", ["user_id", "nominee_list_id"], name: "index_nominee_lists_users_on_user_id_and_nominee_list_id", using: :btree

  create_table "nominee_users", force: true do |t|
    t.integer  "badge_id"
    t.integer  "user_id"
    t.string   "why"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nominee_users", ["badge_id"], name: "index_nominee_users_on_badge_id", using: :btree
  add_index "nominee_users", ["user_id"], name: "index_nominee_users_on_user_id", using: :btree

  create_table "propose_badges", force: true do |t|
    t.string   "name"
    t.integer  "value_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "propose_badges", ["value_id"], name: "index_propose_badges_on_value_id", using: :btree

  create_table "propose_badges_users", id: false, force: true do |t|
    t.integer "propose_badge_id", null: false
    t.integer "user_id",          null: false
  end

  add_index "propose_badges_users", ["propose_badge_id"], name: "index_propose_badges_users_on_propose_badge_id", using: :btree
  add_index "propose_badges_users", ["user_id"], name: "index_propose_badges_users_on_user_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", id: false, force: true do |t|
    t.integer "role_id", null: false
    t.integer "user_id", null: false
  end

  create_table "show_dont_tells_engine_presentations", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "show_dont_tell_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "show_dont_tells_engine_show_dont_tells", force: true do |t|
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skill_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "skill_type_id"
  end

  add_index "skills", ["skill_type_id"], name: "index_skills_on_skill_type_id", using: :btree

  create_table "skills_users", id: false, force: true do |t|
    t.integer "skill_id", null: false
    t.integer "user_id",  null: false
  end

  add_index "skills_users", ["skill_id", "user_id"], name: "index_skills_users_on_skill_id_and_user_id", using: :btree
  add_index "skills_users", ["user_id", "skill_id"], name: "index_skills_users_on_user_id_and_skill_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin"
    t.string   "department"
    t.string   "picture_url"
    t.text     "bio"
    t.integer  "position_id"
    t.string   "position"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["position_id"], name: "index_users_on_position_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votations", force: true do |t|
    t.integer  "badge_id"
    t.boolean  "is_open"
    t.string   "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votations", ["badge_id"], name: "index_votations_on_badge_id", using: :btree

  create_table "votes", force: true do |t|
    t.integer  "votation_id"
    t.integer  "user_id"
    t.integer  "voted_user_id"
    t.string   "reason"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree
  add_index "votes", ["votation_id"], name: "index_votes_on_votation_id", using: :btree

  create_table "workshops_engine_workshops", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "date_and_time"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_published",  default: false
  end

end
