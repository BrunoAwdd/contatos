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

ActiveRecord::Schema.define(version: 20170301211626) do

  create_table "contatos", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "notes"
    t.string   "web_page"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contatos_products", force: :cascade do |t|
    t.integer "contato_id"
    t.integer "product_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string   "name"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "documents", ["product_id"], name: "index_documents_on_product_id"

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

  create_table "juridico_andamentos", force: :cascade do |t|
    t.text     "nota"
    t.datetime "data"
    t.integer  "processo_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "juridico_andamentos", ["processo_id"], name: "index_juridico_andamentos_on_processo_id"

  create_table "juridico_processos", force: :cascade do |t|
    t.string   "number"
    t.integer  "category"
    t.string   "author"
    t.string   "defendant"
    t.datetime "date"
    t.string   "shire"
    t.string   "circuit"
    t.string   "value"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "free"
    t.string   "judge"
    t.string   "classe"
  end

  create_table "newsletters", force: :cascade do |t|
    t.string   "subject"
    t.text     "html_message"
    t.text     "text_message"
    t.integer  "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "newsletters_products", force: :cascade do |t|
    t.integer "newsletter_id"
    t.integer "product_id"
  end

  add_index "newsletters_products", ["newsletter_id"], name: "index_newsletters_products_on_newsletter_id"
  add_index "newsletters_products", ["product_id"], name: "index_newsletters_products_on_product_id"

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

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
