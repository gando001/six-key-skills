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

ActiveRecord::Schema.define(version: 2019_10_06_042005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "blogs", force: :cascade do |t|
    t.string "title"
    t.string "teaser"
    t.text "body"
    t.boolean "motivation", default: false
    t.boolean "mindset", default: false
    t.boolean "resourcing", default: false
    t.boolean "planning", default: false
    t.boolean "time_management", default: false
    t.boolean "discipline", default: false
    t.string "image_url"
    t.text "pinterest_description"
    t.boolean "published", default: false
    t.datetime "published_at"
    t.boolean "approved", default: false
    t.boolean "featured", default: false
    t.bigint "lead_magnet_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "primary_category"
    t.index ["lead_magnet_id"], name: "index_blogs_on_lead_magnet_id"
    t.index ["user_id"], name: "index_blogs_on_user_id"
  end

  create_table "lead_magnets", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.boolean "motivation", default: false
    t.boolean "mindset", default: false
    t.boolean "resourcing", default: false
    t.boolean "planning", default: false
    t.boolean "time_management", default: false
    t.boolean "discipline", default: false
    t.string "lead_magnet_type"
    t.string "link_url"
    t.boolean "active", default: true
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_lead_magnets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "membership", default: "Free"
    t.boolean "contributor", default: false
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "blogs", "lead_magnets"
  add_foreign_key "blogs", "users"
  add_foreign_key "lead_magnets", "users"
end
