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

ActiveRecord::Schema.define(version: 20160618213637) do

  create_table "ads", force: :cascade do |t|
    t.decimal  "budget"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "creatives", force: :cascade do |t|
    t.decimal  "bid"
    t.text     "ad_text"
    t.integer  "ad_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "creatives", ["ad_id"], name: "index_creatives_on_ad_id"

end
