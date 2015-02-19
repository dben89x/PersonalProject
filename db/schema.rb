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

ActiveRecord::Schema.define(version: 20150218183730) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendees", force: true do |t|
    t.integer "user_id"
    t.integer "spot_id"
    t.string  "role"
    t.boolean "arrived"
    t.boolean "attending"
  end

  create_table "cats", force: true do |t|
    t.string "name"
    t.binary "image"
  end

  create_table "comments", force: true do |t|
    t.text    "text"
    t.integer "user_id"
    t.integer "spot_id"
    t.integer "place_id"
  end

  create_table "friends", force: true do |t|
    t.integer "user_id"
    t.integer "friend_id"
  end

  create_table "info", force: true do |t|
    t.integer "rating"
    t.boolean "like"
    t.integer "service"
    t.boolean "familiar"
    t.integer "experience"
    t.text    "activities"
    t.integer "crowd"
    t.integer "price"
    t.integer "place_id"
    t.integer "spot_id"
    t.integer "user_id"
  end

  create_table "placeimages", force: true do |t|
    t.integer  "place_id"
    t.integer  "user_id"
    t.integer  "spot_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "comment"
    t.boolean  "public"
    t.string   "image"
  end

  create_table "places", force: true do |t|
    t.string  "name"
    t.text    "description"
    t.string  "location"
    t.integer "subcat_id"
    t.float   "latitude"
    t.float   "longitude"
    t.string  "kind"
  end

  create_table "spots", force: true do |t|
    t.string   "description"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_time",  default: '2015-01-13 19:55:12'
    t.datetime "end_time"
    t.integer  "place_id"
  end

  create_table "subcats", force: true do |t|
    t.string  "name"
    t.integer "cat_id"
    t.binary  "image"
    t.string  "role"
  end

  create_table "subscriptions", force: true do |t|
    t.integer "user_id"
    t.integer "place_id"
    t.string  "role"
  end

  create_table "users", force: true do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.binary "avatar"
  end

end
