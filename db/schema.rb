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

ActiveRecord::Schema.define(version: 20160721125126) do

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "games_boardgames", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "publisher"
    t.string   "url"
    t.integer  "min_players"
    t.integer  "max_players"
    t.integer  "stock"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "slug"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "games_boardgames", ["slug"], name: "index_games_boardgames_on_slug", unique: true

  create_table "games_consoles", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "console"
    t.string   "publisher"
    t.string   "url"
    t.integer  "min_players"
    t.integer  "max_players"
    t.integer  "stock"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "slug"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "owner"
    t.string   "imdbID"
    t.datetime "released"
  end

  add_index "games_consoles", ["slug"], name: "index_games_consoles_on_slug", unique: true

end
