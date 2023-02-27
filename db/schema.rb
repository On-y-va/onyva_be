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

ActiveRecord::Schema.define(version: 2023_02_27_014256) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flights", force: :cascade do |t|
    t.bigint "user_id"
    t.string "airline_code"
    t.string "flight_number"
    t.datetime "date"
    t.index ["user_id"], name: "index_flights_on_user_id"
  end

  create_table "trip_attendees", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "trip_id"
    t.integer "status", default: 0
    t.index ["trip_id"], name: "index_trip_attendees_on_trip_id"
    t.index ["user_id"], name: "index_trip_attendees_on_user_id"
  end

  create_table "trip_events", force: :cascade do |t|
    t.bigint "trip_id"
    t.datetime "event_date"
    t.datetime "event_time"
    t.string "event_id"
    t.integer "votes"
    t.boolean "confirmed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "address"
    t.index ["trip_id"], name: "index_trip_events_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "country"
    t.string "postcode"
    t.string "place_id"
    t.string "start_date"
    t.string "end_date"
    t.string "image_url"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "email"
    t.string "emergency_contact_name"
    t.string "emergency_contact_phone_number"
    t.string "google_uid"
  end

  add_foreign_key "flights", "users"
  add_foreign_key "trip_attendees", "trips"
  add_foreign_key "trip_attendees", "users"
  add_foreign_key "trip_events", "trips"
end
