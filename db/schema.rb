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

ActiveRecord::Schema.define(version: 20170111154227) do

  create_table "fooditems", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.integer  "serving_type_id"
    t.integer  "serving_size"
    t.integer  "calories"
    t.float    "total_fat",          limit: 24
    t.float    "saturated_fat",      limit: 24
    t.float    "trans_fat",          limit: 24
    t.float    "cholesterol",        limit: 24
    t.float    "total_carbohydrate", limit: 24
    t.float    "dietary_fiber",      limit: 24
    t.float    "sugars",             limit: 24
    t.float    "protein",            limit: 24
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "user_id"
  end

  create_table "meal_fooditems", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "meal_id"
    t.integer "fooditem_id"
  end

  create_table "meals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
  end

  create_table "serving_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
  end

  create_table "user_meals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.integer "meal_id"
    t.date    "date_eaten"
    t.time    "time_eaten"
    t.string  "data"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "username"
    t.string "password_digest"
  end

end
