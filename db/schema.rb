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

ActiveRecord::Schema.define(version: 20181112185021) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buses", force: :cascade do |t|
    t.bigint "transporter_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "carrier_name"
    t.string "registration"
    t.string "make"
    t.index ["transporter_id"], name: "index_buses_on_transporter_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "froms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "journeys", force: :cascade do |t|
    t.decimal "price"
    t.datetime "departure"
    t.datetime "arrival"
    t.text "description"
    t.bigint "from_id"
    t.bigint "to_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "stop_id"
    t.integer "bus_id"
    t.integer "total_seats"
    t.integer "user_id"
    t.index ["from_id"], name: "index_journeys_on_from_id"
    t.index ["to_id"], name: "index_journeys_on_to_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.string "email"
    t.integer "amount"
    t.string "description"
    t.string "currency"
    t.string "customer_id"
    t.string "card"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "seat_id"
    t.integer "journey_id"
    t.string "uuid"
  end

  create_table "searches", force: :cascade do |t|
    t.integer "from_id"
    t.integer "stop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "departure"
  end

  create_table "seats", force: :cascade do |t|
    t.integer "seat_number"
    t.bigint "journey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "occupied"
    t.integer "bus_id"
    t.boolean "selected"
    t.index ["journey_id"], name: "index_seats_on_journey_id"
  end

  create_table "sits", force: :cascade do |t|
    t.string "number"
    t.boolean "occupied"
    t.bigint "bus_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "seat"
    t.integer "purchase_id"
    t.index ["bus_id"], name: "index_sits_on_bus_id"
  end

  create_table "tos", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "transporter"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "journeys", "froms"
  add_foreign_key "journeys", "tos"
  add_foreign_key "seats", "journeys"
  add_foreign_key "sits", "buses"
end
