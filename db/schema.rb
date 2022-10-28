# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_10_27_192716) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "routes", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes_stations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "route_id", null: false
    t.bigint "station_id", null: false
    t.integer "order_number"
    t.datetime "arrival_time", precision: nil
    t.datetime "departure_time", precision: nil
    t.integer "status"
    t.index ["route_id"], name: "index_routes_stations_on_route_id"
    t.index ["station_id"], name: "index_routes_stations_on_station_id"
  end

  create_table "stations", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "train_id", null: false
    t.bigint "first_station_id", null: false
    t.bigint "last_station_id", null: false
    t.bigint "user_id", null: false
    t.index ["first_station_id"], name: "index_tickets_on_first_station_id"
    t.index ["last_station_id"], name: "index_tickets_on_last_station_id"
    t.index ["train_id"], name: "index_tickets_on_train_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "trains", force: :cascade do |t|
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "route_id"
    t.bigint "current_station_id"
    t.boolean "ascending_sorting", default: true
    t.index ["current_station_id"], name: "index_trains_on_current_station_id"
    t.index ["route_id"], name: "index_trains_on_route_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "passport_code"
  end

  create_table "wagons", force: :cascade do |t|
    t.string "type"
    t.integer "top_seats_quantity"
    t.integer "lower_seats_quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "train_id", null: false
    t.integer "side_top_seats_quantity"
    t.integer "side_lower_seats_quantity"
    t.integer "seated_seats_quantity"
    t.integer "order_number"
    t.index ["train_id"], name: "index_wagons_on_train_id"
  end

  add_foreign_key "routes_stations", "routes"
  add_foreign_key "routes_stations", "stations"
  add_foreign_key "tickets", "stations", column: "first_station_id"
  add_foreign_key "tickets", "stations", column: "last_station_id"
  add_foreign_key "tickets", "trains"
  add_foreign_key "tickets", "users"
  add_foreign_key "trains", "routes"
  add_foreign_key "trains", "stations", column: "current_station_id"
  add_foreign_key "wagons", "trains"
end
