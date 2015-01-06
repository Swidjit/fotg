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

ActiveRecord::Schema.define(version: 20150106050401) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_stats", force: true do |t|
    t.float   "avg"
    t.integer "total"
    t.integer "plays"
    t.integer "user_id"
    t.integer "game_id"
  end

  create_table "games", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "logo_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "avg"
    t.integer  "plays",       default: 0
    t.integer  "game_num",    default: 1
  end

  create_table "rankings", force: true do |t|
    t.integer "game_id"
    t.integer "user_id"
    t.float   "score"
    t.float   "percentile"
  end

  create_table "scores", force: true do |t|
    t.integer  "game_id"
    t.integer  "user_id"
    t.integer  "game_num"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "value",      default: 0
  end

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "first_name"
    t.string   "username"
    t.string   "about"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
