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

ActiveRecord::Schema.define(version: 20150622181754) do

  create_table "advertisers", force: :cascade do |t|
    t.string   "name"
    t.string   "contact_name"
    t.string   "contact_email"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "epom_id"
  end

  create_table "banners", force: :cascade do |t|
    t.integer  "epom_id"
    t.string   "placement_type"
    t.integer  "campaign_id"
    t.integer  "weight"
    t.string   "image_banner_link"
    t.string   "url"
    t.string   "name"
    t.string   "banner_type"
    t.integer  "ad_unit_id"
    t.integer  "ad_unit_width"
    t.integer  "ad_unit_height"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
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

  create_table "placements", force: :cascade do |t|
    t.integer  "epom_id"
    t.integer  "zone_id"
    t.string   "placement_type"
    t.string   "name"
    t.integer  "ad_unit_id"
    t.integer  "size_height"
    t.integer  "size_width"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "sites", force: :cascade do |t|
    t.integer  "epom_id"
    t.string   "name"
    t.string   "url"
    t.text     "description"
    t.string   "email"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "zones", force: :cascade do |t|
    t.integer  "epom_id"
    t.string   "name"
    t.text     "description"
    t.integer  "site_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
