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

ActiveRecord::Schema.define(version: 20160312101533) do

  create_table "addresses", force: :cascade do |t|
    t.text     "address_line1", limit: 65535
    t.text     "address_line2", limit: 65535
    t.string   "landmark",      limit: 255
    t.integer  "store_id",      limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "locations", force: :cascade do |t|
    t.decimal  "latitude",             precision: 10, scale: 6
    t.decimal  "decimal",              precision: 10, scale: 6
    t.decimal  "longitude",            precision: 10, scale: 6
    t.integer  "store_id",   limit: 4
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  create_table "stores", force: :cascade do |t|
    t.integer  "category_id",     limit: 4
    t.string   "store_name",      limit: 255
    t.time     "open_time"
    t.time     "close_time"
    t.string   "store_owner",     limit: 255
    t.integer  "phone_no",        limit: 4
    t.text     "description",     limit: 65535
    t.integer  "sub_category_id", limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.text     "description",     limit: 65535
    t.integer  "category_id",     limit: 4
    t.integer  "sub_category_id", limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.string   "user_name",  limit: 255
    t.string   "password",   limit: 255
    t.string   "location",   limit: 255
    t.integer  "phone_no",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
