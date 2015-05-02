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

ActiveRecord::Schema.define(version: 20150430043651) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.boolean  "active"
    t.integer  "accountable_id"
    t.string   "accountable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "accounts", ["accountable_type", "accountable_id"], name: "index_accounts_on_accountable_type_and_accountable_id", using: :btree

  create_table "blobs", force: :cascade do |t|
    t.string   "blob_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "data", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.integer  "price_cents"
    t.integer  "datable_id"
    t.string   "datable_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "data", ["datable_type", "datable_id"], name: "index_data_on_datable_type_and_datable_id", using: :btree

  create_table "purchases", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "datum_id"
    t.integer  "amount_cents"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "purchases", ["datum_id"], name: "index_purchases_on_datum_id", using: :btree
  add_index "purchases", ["user_id"], name: "index_purchases_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "currency"
    t.string   "stripe_publishable_key"
    t.string   "stripe_secret_key"
    t.string   "stripe_user_id"
    t.string   "stripe_account_type"
    t.text     "stripe_account_status",  default: "{}"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
  end

end
