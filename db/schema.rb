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

ActiveRecord::Schema.define(version: 20160704075820) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bings", force: :cascade do |t|
    t.integer  "draftee_id"
    t.datetime "date"
    t.string   "title",       limit: 256
    t.string   "description", limit: 512
    t.string   "url",         limit: 512
    t.string   "thumbnail",   limit: 512
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "bings", ["draftee_id"], name: "index_bings_on_draftee_id", using: :btree

  create_table "draftees", force: :cascade do |t|
    t.string   "name"
    t.string   "twitter"
    t.string   "instagram"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "draftees", ["name"], name: "index_draftees_on_name", unique: true, using: :btree

  create_table "tweets", force: :cascade do |t|
    t.integer  "draftee_id"
    t.datetime "date"
    t.string   "t_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tweets", ["draftee_id"], name: "index_tweets_on_draftee_id", using: :btree

  add_foreign_key "bings", "draftees"
  add_foreign_key "tweets", "draftees"
end
