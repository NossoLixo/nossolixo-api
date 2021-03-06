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

ActiveRecord::Schema.define(version: 20161204124237) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"
  enable_extension "uuid-ossp"

  create_table "categories", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name",            null: false
    t.boolean  "approved",        null: false
    t.datetime "approved_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.uuid     "requested_by_id", null: false
    t.uuid     "approved_by_id"
    t.index ["approved_by_id"], name: "index_categories_on_approved_by_id", using: :btree
    t.index ["requested_by_id"], name: "index_categories_on_requested_by_id", using: :btree
  end

  create_table "categories_places", id: false, force: :cascade do |t|
    t.uuid "place_id",    null: false
    t.uuid "category_id", null: false
    t.index ["place_id", "category_id"], name: "index_categories_places_on_place_id_and_category_id", using: :btree
  end

  create_table "places", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "description"
    t.string   "street",          null: false
    t.string   "number"
    t.string   "district"
    t.string   "lat",             null: false
    t.string   "lng",             null: false
    t.string   "phone_number"
    t.string   "email"
    t.string   "site"
    t.uuid     "requested_by_id", null: false
    t.uuid     "approved_by_id"
    t.boolean  "approved",        null: false
    t.datetime "approved_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "city",            null: false
    t.string   "state",           null: false
    t.index ["approved_by_id"], name: "index_places_on_approved_by_id", using: :btree
    t.index ["requested_by_id"], name: "index_places_on_requested_by_id", using: :btree
  end

  create_table "users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name",                                     null: false
    t.string   "email"
    t.json     "tokens"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "role",                                     null: false
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

  add_foreign_key "categories", "users", column: "approved_by_id"
  add_foreign_key "categories", "users", column: "requested_by_id"
  add_foreign_key "places", "users", column: "approved_by_id"
  add_foreign_key "places", "users", column: "requested_by_id"
end
