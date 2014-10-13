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

ActiveRecord::Schema.define(version: 20141013212231) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "daily_reports", force: true do |t|
    t.datetime "date_recieved"
    t.text     "content"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "employee_id"
  end

  add_index "daily_reports", ["employee_id"], name: "index_daily_reports_on_employee_id", using: :btree

  create_table "employees", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
    t.string   "email"
  end

  create_table "reports", force: true do |t|
    t.date     "date_start"
    t.date     "date_end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
