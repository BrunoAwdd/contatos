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

ActiveRecord::Schema.define(version: 20160705160951) do

  create_table "contatos", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "display_name"
    t.string   "email"
    t.string   "email2"
    t.string   "home_fone"
    t.string   "business_fone"
    t.string   "mobile_fone"
    t.string   "home_city"
    t.string   "home_state"
    t.string   "home_country"
    t.string   "notes"
    t.string   "web_page"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
