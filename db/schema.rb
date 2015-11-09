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

ActiveRecord::Schema.define(version: 20151108233744) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "playlists", force: :cascade do |t|
    t.string   "name"
    t.integer  "fb_event_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tracks", force: :cascade do |t|
    t.integer  "playlist_id"
    t.string   "caption"
    t.string   "link"
    t.string   "source"
    t.string   "name"
    t.text     "fb_message"
    t.integer  "fb_user_id"
    t.string   "fb_user_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "tracks", ["playlist_id"], name: "index_tracks_on_playlist_id", using: :btree

  add_foreign_key "tracks", "playlists"
end
