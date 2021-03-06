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

ActiveRecord::Schema.define(version: 20170116113155) do

  create_table "accommodations", force: :cascade do |t|
    t.string  "name",               limit: 255, null: false
    t.integer "personsFrom",        limit: 4
    t.integer "personsTo",          limit: 4
    t.boolean "view",                           null: false
    t.boolean "appartment",                     null: false
    t.integer "accommodation_type", limit: 4,   null: false
  end

  create_table "descriptions", force: :cascade do |t|
    t.integer "accommodation_id", limit: 4
    t.string  "description",      limit: 255
  end

  create_table "internets", force: :cascade do |t|
    t.boolean "boolInternet",            null: false
    t.float   "price",        limit: 24
  end

  create_table "parkings", force: :cascade do |t|
    t.boolean "boolParking",            null: false
    t.float   "price",       limit: 24
  end

  create_table "persons", force: :cascade do |t|
    t.integer "user_id",   limit: 4
    t.string  "name",      limit: 255, null: false
    t.string  "surname",   limit: 255, null: false
    t.string  "country",   limit: 255, null: false
    t.string  "address",   limit: 255, null: false
    t.integer "addressNo", limit: 4,   null: false
    t.string  "city",      limit: 255, null: false
  end

  create_table "photos", force: :cascade do |t|
    t.integer "accommodation_id", limit: 4
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "dateFrom",                                      null: false
    t.datetime "dateTo",                                        null: false
    t.boolean  "boolTv",                        default: false
    t.boolean  "boolParking",                   default: false
    t.boolean  "boolInternet",                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "accommodation_id",  limit: 4,                   null: false
    t.string   "email",             limit: 255,                 null: false
    t.integer  "user_id",           limit: 4,                   null: false
    t.integer  "number_of_persons", limit: 4,                   null: false
  end

  create_table "tvs", force: :cascade do |t|
    t.boolean "boolTv",            null: false
    t.float   "price",  limit: 24
  end

  create_table "users", force: :cascade do |t|
    t.string  "email",          limit: 255,                 null: false
    t.string  "password",       limit: 255,                 null: false
    t.integer "privilege",      limit: 4,   default: 0
    t.integer "confirm_status", limit: 4,   default: 0
    t.boolean "active",                     default: false
  end

end
