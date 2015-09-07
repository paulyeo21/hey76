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

ActiveRecord::Schema.define(version: 20150905105945) do

  create_table "draftees", force: :cascade do |t|
    t.string   "name"
    t.string   "twitter"
    t.string   "instagram"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "draftees", ["name"], name: "index_draftees_on_name", unique: true

  create_table "inserts", force: :cascade do |t|
    t.text     "content"
    t.integer  "draftee_id"
    t.datetime "date"
    t.string   "type"
    t.integer  "content_id", limit: 8
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "inserts", ["date"], name: "index_inserts_on_date"
  add_index "inserts", ["draftee_id", "date"], name: "index_inserts_on_draftee_id_and_date"
  add_index "inserts", ["draftee_id"], name: "index_inserts_on_draftee_id"

end