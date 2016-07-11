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

ActiveRecord::Schema.define(version: 20160711214149) do

  create_table "contatos", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "notes"
    t.string   "web_page"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contatos_products", force: :cascade do |t|
    t.integer "contatos_id"
    t.integer "products_id"
  end

  create_table "emails", force: :cascade do |t|
    t.string   "email"
    t.integer  "contato_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "emails", ["contato_id"], name: "index_emails_on_contato_id"

  create_table "enderecos", force: :cascade do |t|
    t.string   "tipo"
    t.string   "cidade"
    t.string   "estado"
    t.string   "pais"
    t.integer  "contato_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "enderecos", ["contato_id"], name: "index_enderecos_on_contato_id"

  create_table "notes", force: :cascade do |t|
    t.string   "observacao"
    t.integer  "contato_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "notes", ["contato_id"], name: "index_notes_on_contato_id"

  create_table "products", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "telefones", force: :cascade do |t|
    t.string   "tipo"
    t.string   "ddd"
    t.string   "telefone"
    t.integer  "contato_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "telefones", ["contato_id"], name: "index_telefones_on_contato_id"

end
