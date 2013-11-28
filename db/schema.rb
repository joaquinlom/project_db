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

ActiveRecord::Schema.define(version: 20131126184829) do

  create_table "authentications", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.integer  "customer_id"
    t.string   "customer_first_name"
    t.string   "customer_last_name"
    t.string   "customer_address"
    t.string   "customer_city"
    t.string   "customer_state"
    t.string   "customer_zip"
    t.string   "customer_phone"
    t.string   "customer_fax"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
  end

  create_table "items", force: true do |t|
    t.integer  "item_id"
    t.string   "title"
    t.string   "artist"
    t.float    "unit_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items_orders", force: true do |t|
    t.integer "item_id"
    t.integer "order_details_id"
  end

  create_table "order_details", force: true do |t|
    t.integer  "order_id"
    t.integer  "item_id"
    t.integer  "order_qty"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "customer_id"
    t.integer  "order_id"
    t.integer  "custome_id"
    t.datetime "order_date"
    t.datetime "shipped_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "second_last_name"
    t.string   "email"
    t.string   "password_hash"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nickname"
    t.string   "password_salt"
  end

end
