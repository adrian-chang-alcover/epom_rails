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

ActiveRecord::Schema.define(version: 20150608195747) do

  create_table "advertisers", force: :cascade do |t|
    t.string   "name"
    t.string   "contact_name"
    t.string   "contact_email"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "epom_id"
  end

  create_table "campaigns", force: :cascade do |t|
    t.string   "name"
    t.integer  "advertiser_id"
    t.text     "description"
    t.integer  "weight"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "epom_id"
  end

end
