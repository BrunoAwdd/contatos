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

ActiveRecord::Schema.define(version: 20180301163245) do

  create_table "business_generals", force: :cascade do |t|
    t.datetime "date_entry"
    t.string   "subject"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.text     "condition"
  end

  create_table "business_generals_contacts", id: false, force: :cascade do |t|
    t.integer "business_generals_id"
    t.integer "contato_id"
    t.index ["business_generals_id"], name: "index_business_generals_contacts_on_business_generals_id"
    t.index ["contato_id"], name: "index_business_generals_contacts_on_contato_id"
  end

  create_table "business_histories", force: :cascade do |t|
    t.datetime "date_entry"
    t.text     "note"
    t.integer  "business_general_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["business_general_id"], name: "index_business_histories_on_business_general_id"
  end

  create_table "business_intermediaries", force: :cascade do |t|
    t.text     "note"
    t.integer  "business_general_id"
    t.integer  "contato_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["business_general_id"], name: "index_business_intermediaries_on_business_general_id"
    t.index ["contato_id"], name: "index_business_intermediaries_on_contato_id"
  end

  create_table "business_notes", force: :cascade do |t|
    t.text     "note"
    t.integer  "business_general_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["business_general_id"], name: "index_business_notes_on_business_general_id"
  end

  create_table "contatos", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "notes"
    t.string   "web_page"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contatos_product_generals", force: :cascade do |t|
    t.integer "contato_id"
    t.integer "product_generals_id"
    t.index ["contato_id"], name: "index_contatos_products_on_contato_id"
    t.index ["product_generals_id"], name: "index_contatos_products_on_product_generals_id"
  end

  create_table "credit_bank_addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "number"
    t.string   "neighborhood"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zipcode"
    t.integer  "credit_bank_general_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["credit_bank_general_id"], name: "index_credit_bank_addresses_on_credit_bank_general_id"
  end

  create_table "credit_bank_emails", force: :cascade do |t|
    t.string   "email"
    t.integer  "credit_bank_general_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["credit_bank_general_id"], name: "index_credit_bank_emails_on_credit_bank_general_id"
  end

  create_table "credit_bank_generals", force: :cascade do |t|
    t.string   "name"
    t.string   "agency"
    t.integer  "contato_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contato_id"], name: "index_credit_bank_generals_on_contato_id"
  end

  create_table "credit_bank_phones", force: :cascade do |t|
    t.string   "ddd"
    t.string   "phone"
    t.string   "model"
    t.integer  "credit_bank_general_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["credit_bank_general_id"], name: "index_credit_bank_phones_on_credit_bank_general_id"
  end

  create_table "credit_client_addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "number"
    t.string   "neighborhood"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zipcode"
    t.integer  "credit_client_general_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["credit_client_general_id"], name: "index_credit_client_addresses_on_credit_client_general_id"
  end

  create_table "credit_client_documents", force: :cascade do |t|
    t.integer  "status"
    t.integer  "exemption"
    t.date     "date"
    t.integer  "credit_client_general_id"
    t.integer  "credit_document_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["credit_client_general_id"], name: "index_credit_client_documents_on_credit_client_general_id"
    t.index ["credit_document_id"], name: "index_credit_client_documents_on_credit_document_id"
  end

  create_table "credit_client_emails", force: :cascade do |t|
    t.string   "email"
    t.string   "contact"
    t.integer  "credit_client_general_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["credit_client_general_id"], name: "index_credit_client_emails_on_credit_client_general_id"
  end

  create_table "credit_client_generals", force: :cascade do |t|
    t.string   "name"
    t.string   "brand"
    t.string   "cnpj"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "condition"
  end

  create_table "credit_client_generals_contacts", force: :cascade do |t|
    t.integer "credit_client_id"
    t.integer "contato_id"
    t.index ["contato_id"], name: "index_credit_client_generals_contacts_on_contato_id"
    t.index ["credit_client_id"], name: "index_credit_client_generals_contacts_on_credit_client_id"
  end

  create_table "credit_client_intermediaries", force: :cascade do |t|
    t.string   "name"
    t.text     "note"
    t.integer  "credit_client_general_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "contato_id"
    t.index ["contato_id"], name: "index_credit_client_intermediaries_on_contato_id"
    t.index ["credit_client_general_id"], name: "index_credit_client_intermediaries_on_credit_client_general_id"
  end

  create_table "credit_client_legals", force: :cascade do |t|
    t.string   "number"
    t.date     "date"
    t.text     "note"
    t.integer  "credit_client_general_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["credit_client_general_id"], name: "index_credit_client_legals_on_credit_client_general_id"
  end

  create_table "credit_client_notes", force: :cascade do |t|
    t.text     "note"
    t.date     "date"
    t.integer  "credit_client_general_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["credit_client_general_id"], name: "index_credit_client_notes_on_credit_client_general_id"
  end

  create_table "credit_client_partner_bases", force: :cascade do |t|
    t.string   "name"
    t.integer  "credit_client_general_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "contato_id"
    t.index ["contato_id"], name: "index_credit_client_partner_bases_on_contato_id"
    t.index ["credit_client_general_id"], name: "index_credit_client_partner_bases_on_credit_client_general_id"
  end

  create_table "credit_client_partner_document_lists", force: :cascade do |t|
    t.string   "name"
    t.integer  "frequency_unity"
    t.integer  "frequency_number"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "credit_client_partner_documents", force: :cascade do |t|
    t.integer  "status"
    t.integer  "exemption"
    t.date     "date"
    t.integer  "document_list_id"
    t.integer  "partner_base_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["document_list_id"], name: "index_credit_client_partner_documents_on_document_list_id"
    t.index ["partner_base_id"], name: "index_credit_client_partner_documents_on_partner_base_id"
  end

  create_table "credit_client_phones", force: :cascade do |t|
    t.string   "ddd"
    t.string   "phone"
    t.string   "model"
    t.integer  "credit_client_general_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["credit_client_general_id"], name: "index_credit_client_phones_on_credit_client_general_id"
  end

  create_table "credit_client_warranty_addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "number"
    t.string   "neighborhood"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zipcode"
    t.integer  "warranty_base_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["warranty_base_id"], name: "index_credit_client_warranty_addresses_on_warranty_base_id"
  end

  create_table "credit_client_warranty_bases", force: :cascade do |t|
    t.string   "name"
    t.integer  "credit_client_general_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["credit_client_general_id"], name: "index_credit_client_warranty_bases_on_credit_client_general_id"
  end

  create_table "credit_client_warranty_document_lists", force: :cascade do |t|
    t.string   "name"
    t.integer  "frequency_unity"
    t.integer  "frequency_number"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "credit_client_warranty_documents", force: :cascade do |t|
    t.integer  "status"
    t.integer  "exemption"
    t.date     "date"
    t.integer  "document_list_id"
    t.integer  "warranty_base_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["document_list_id"], name: "index_credit_client_warranty_documents_on_document_list_id"
    t.index ["warranty_base_id"], name: "index_credit_client_warranty_documents_on_warranty_base_id"
  end

  create_table "credit_client_warranty_infos", force: :cascade do |t|
    t.integer  "value"
    t.text     "notes"
    t.integer  "price"
    t.text     "condition"
    t.integer  "warranty_base_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["warranty_base_id"], name: "index_credit_client_warranty_infos_on_warranty_base_id"
  end

  create_table "credit_documents", force: :cascade do |t|
    t.string   "name"
    t.integer  "frequency_unity"
    t.integer  "frequency_number"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "credit_lines", force: :cascade do |t|
    t.string   "name"
    t.string   "value"
    t.text     "note"
    t.date     "date"
    t.integer  "status"
    t.integer  "credit_bank_general_id"
    t.integer  "credit_client_general_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["credit_bank_general_id"], name: "index_credit_lines_on_credit_bank_general_id"
    t.index ["credit_client_general_id"], name: "index_credit_lines_on_credit_client_general_id"
  end

  create_table "emails", force: :cascade do |t|
    t.string   "email"
    t.integer  "contato_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contato_id"], name: "index_emails_on_contato_id"
  end

  create_table "enderecos", force: :cascade do |t|
    t.string   "tipo"
    t.string   "cidade"
    t.string   "estado"
    t.string   "pais"
    t.integer  "contato_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contato_id"], name: "index_enderecos_on_contato_id"
  end

  create_table "juridico_andamentos", force: :cascade do |t|
    t.text     "nota"
    t.datetime "data"
    t.integer  "processo_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["processo_id"], name: "index_juridico_andamentos_on_processo_id"
  end

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
    t.index ["newsletter_id"], name: "index_newsletters_products_on_newsletter_id"
    t.index ["product_id"], name: "index_newsletters_products_on_product_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string   "observacao"
    t.integer  "contato_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contato_id"], name: "index_notes_on_contato_id"
  end

  create_table "product_documents", force: :cascade do |t|
    t.string   "name"
    t.integer  "product_generals_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["product_generals_id"], name: "index_product_documents_on_product_generals_id"
  end

  create_table "product_generals", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_notes", force: :cascade do |t|
    t.text     "nota"
    t.datetime "data"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_notes_on_product_id"
  end

  create_table "telefones", force: :cascade do |t|
    t.string   "tipo"
    t.string   "ddd"
    t.string   "telefone"
    t.integer  "contato_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contato_id"], name: "index_telefones_on_contato_id"
  end

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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "usuario_generals", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.integer  "usuario_roles_id"
    t.integer  "user_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "messages_count",   default: 0
    t.index ["user_id"], name: "index_usuario_generals_on_user_id"
    t.index ["usuario_roles_id"], name: "index_usuario_generals_on_usuario_roles_id"
  end

  create_table "usuario_messages", force: :cascade do |t|
    t.text     "message"
    t.string   "subject"
    t.binary   "visualized", default: "0"
    t.integer  "status"
    t.integer  "to_id"
    t.integer  "from_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "usuario_roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
