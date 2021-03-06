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

ActiveRecord::Schema.define(version: 20180228211632) do

  create_table "cars", id: :string, force: :cascade do |t|
    t.string "name"
    t.decimal "horsepower"
    t.decimal "price"
    t.string "cars_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "sqlite_autoindex_cars_1", unique: true
    t.index [nil], name: "index_cars_on_car_type_id"
  end

  create_table "cars_types", id: :string, force: :cascade do |t|
    t.string "car_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "sqlite_autoindex_cars_types_1", unique: true
  end

end
