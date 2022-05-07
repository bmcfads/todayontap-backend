# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_06_172455) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.boolean "featured"
    t.string "category"
    t.string "name"
    t.text "description"
    t.datetime "datetime"
    t.string "website_url"
    t.text "thumbnail_url"
    t.text "banner_url"
    t.bigint "venue_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["venue_id"], name: "index_events_on_venue_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "venues", force: :cascade do |t|
    t.boolean "featured"
    t.string "category"
    t.string "name"
    t.text "description"
    t.string "street"
    t.string "city"
    t.string "province"
    t.string "postal_code"
    t.string "slug"
    t.string "website_url"
    t.text "thumbnail_url"
    t.text "banner_url"
    t.text "google_maps_embed_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_venues_on_slug", unique: true
  end

  add_foreign_key "events", "venues"
end
