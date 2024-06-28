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

ActiveRecord::Schema[7.1].define(version: 2024_06_28_135115) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.integer "zip_code"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "business_schedules", force: :cascade do |t|
    t.string "week_start"
    t.string "business_days", array: true
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "perspective_id", null: false
    t.index ["perspective_id"], name: "index_business_schedules_on_perspective_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "company_name"
    t.string "industry_type"
    t.integer "company_size"
    t.string "website_link"
    t.string "access_url"
    t.time "time_zone"
    t.string "company_logo"
    t.string "custom_domain"
    t.string "fiscal_type"
    t.integer "num_of_months"
    t.string "start_month"
    t.string "end_month"
    t.string "hierarchy_preference"
    t.string "reporting_manager"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currencies", force: :cascade do |t|
    t.string "home_currency"
    t.string "code_symbol"
    t.integer "decimal_places"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "perspective_id", null: false
    t.index ["perspective_id"], name: "index_currencies_on_perspective_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "group_name"
    t.bigint "perspective_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "group_description"
    t.index ["perspective_id"], name: "index_groups_on_perspective_id"
  end

  create_table "holiday_details", force: :cascade do |t|
    t.string "holiday_name"
    t.date "holiday_date"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "perspective_id", null: false
    t.index ["perspective_id"], name: "index_holiday_details_on_perspective_id"
  end

  create_table "perspectives", force: :cascade do |t|
    t.string "perspective_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "perspective_description"
  end

  create_table "themes", force: :cascade do |t|
    t.string "theme_name"
    t.bigint "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "theme_description"
    t.index ["group_id"], name: "index_themes_on_group_id"
  end

  create_table "user_company_address_mappings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "address_id", null: false
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_user_company_address_mappings_on_address_id"
    t.index ["company_id"], name: "index_user_company_address_mappings_on_company_id"
    t.index ["user_id"], name: "index_user_company_address_mappings_on_user_id"
  end

  create_table "user_group_mappings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_user_group_mappings_on_group_id"
    t.index ["user_id"], name: "index_user_group_mappings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "work_email_address"
    t.string "password"
    t.string "prefered_language"
    t.string "ai_assistant"
    t.string "profile_image"
    t.integer "whatsapp_number"
    t.integer "mobile_number"
    t.boolean "is_logged_in"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.index ["company_id"], name: "index_users_on_company_id"
  end

  add_foreign_key "business_schedules", "perspectives"
  add_foreign_key "currencies", "perspectives"
  add_foreign_key "groups", "perspectives"
  add_foreign_key "holiday_details", "perspectives"
  add_foreign_key "themes", "groups"
  add_foreign_key "user_company_address_mappings", "addresses"
  add_foreign_key "user_company_address_mappings", "companies"
  add_foreign_key "user_company_address_mappings", "users"
  add_foreign_key "user_group_mappings", "groups"
  add_foreign_key "user_group_mappings", "users"
  add_foreign_key "users", "companies"
end
