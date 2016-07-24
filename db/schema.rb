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

ActiveRecord::Schema.define(version: 20160724202050) do

  create_table "establishments", force: :cascade do |t|
    t.string   "name"
    t.string   "establishment_type"
    t.string   "address"
    t.string   "status"
    t.integer  "min_inspections"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "infractions", force: :cascade do |t|
    t.integer  "inspection_id"
    t.string   "details"
    t.string   "severity"
    t.string   "action"
    t.string   "court_outcome"
    t.decimal  "amount_fined"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "inspections", force: :cascade do |t|
    t.integer  "establishment_id"
    t.date     "date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
