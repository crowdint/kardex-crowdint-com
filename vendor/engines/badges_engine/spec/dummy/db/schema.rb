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

ActiveRecord::Schema.define(version: 20140702070844) do

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
    t.integer  "level_id"
  end

  add_index "badges_engine_badges", ["award_id"], name: "index_badges_engine_badges_on_award_id"
  add_index "badges_engine_badges", ["value_id"], name: "index_badges_engine_badges_on_value_id"

  create_table "badges_engine_levels", force: true do |t|
    t.integer  "tier"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "badge_alias"
    t.integer  "badge_id"
  end

  add_index "badges_engine_levels", ["badge_id"], name: "index_badges_engine_levels_on_badge_id"

  create_table "badges_engine_values", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
