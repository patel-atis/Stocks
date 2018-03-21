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

ActiveRecord::Schema.define(version: 20180321193115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ledgers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "stock_id"
    t.boolean "holding?"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer "stock_id"
    t.string "user_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower"
    t.integer "followed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed"], name: "index_relationships_on_followed"
    t.index ["follower", "followed"], name: "index_relationships_on_follower_and_followed", unique: true
    t.index ["follower"], name: "index_relationships_on_follower"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "company"
    t.string "ticker"
    t.decimal "price"
    t.decimal "dividend"
    t.boolean "type"
    t.string "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "pass_hash"
    t.string "rem_hash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
