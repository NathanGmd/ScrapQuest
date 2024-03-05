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

ActiveRecord::Schema[7.1].define(version: 2024_03_05_102043) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "features", force: :cascade do |t|
    t.string "title"
    t.string "unit"
    t.integer "min"
    t.integer "max"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "filters", force: :cascade do |t|
    t.integer "value"
    t.bigint "option_id", null: false
    t.bigint "research_id", null: false
    t.bigint "feature_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id"], name: "index_filters_on_feature_id"
    t.index ["option_id"], name: "index_filters_on_option_id"
    t.index ["research_id"], name: "index_filters_on_research_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "gender"
    t.string "profession"
    t.string "study_lvl"
    t.string "nationality"
    t.string "language"
    t.integer "age"
    t.boolean "marital_status"
    t.string "city"
    t.boolean "children"
    t.bigint "feature_id", null: false
    t.bigint "option_id", null: false
    t.bigint "prospect_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id"], name: "index_items_on_feature_id"
    t.index ["option_id"], name: "index_items_on_option_id"
    t.index ["prospect_id"], name: "index_items_on_prospect_id"
  end

  create_table "options", force: :cascade do |t|
    t.string "value"
    t.bigint "feature_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id"], name: "index_options_on_feature_id"
  end

  create_table "prospects", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "researches", force: :cascade do |t|
    t.integer "prospect_count"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_researches_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "filters", "features"
  add_foreign_key "filters", "options"
  add_foreign_key "filters", "researches"
  add_foreign_key "items", "features"
  add_foreign_key "items", "options"
  add_foreign_key "items", "prospects"
  add_foreign_key "options", "features"
  add_foreign_key "researches", "users"
end
