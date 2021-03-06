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

ActiveRecord::Schema.define(version: 20140509154902) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hit_types", force: true do |t|
    t.string "name"
  end

  create_table "hits", force: true do |t|
    t.integer "player_id"
    t.string  "coords"
    t.integer "hit_type_id"
  end

  create_table "players", force: true do |t|
    t.string   "name"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "team_id"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "lineup",                     default: [], array: true
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "stadium_chart_file_name"
    t.string   "stadium_chart_content_type"
    t.integer  "stadium_chart_file_size"
    t.datetime "stadium_chart_updated_at"
  end

end
