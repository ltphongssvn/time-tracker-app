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

ActiveRecord::Schema[8.0].define(version: 2025_07_29_225354) do
  create_table "categories", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.string "color"
    t.integer "parent_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "goal_completions", force: :cascade do |t|
    t.integer "goal_id", null: false
    t.date "date"
    t.boolean "achieved"
    t.integer "actual_minutes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["goal_id"], name: "index_goal_completions_on_goal_id"
  end

  create_table "goals", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "category_id"
    t.string "goal_type"
    t.integer "target_minutes"
    t.integer "hour"
    t.string "days_of_week"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_goals_on_category_id"
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "time_entries", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "category_id", null: false
    t.date "date"
    t.integer "hour"
    t.integer "duration_minutes"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_time_entries_on_category_id"
    t.index ["user_id", "date", "hour"], name: "index_time_entries_on_user_id_and_date_and_hour"
    t.index ["user_id"], name: "index_time_entries_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password"
    t.string "first_name"
    t.string "last_name"
    t.string "time_zone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "categories", "users"
  add_foreign_key "goal_completions", "goals"
  add_foreign_key "goals", "categories"
  add_foreign_key "goals", "users"
  add_foreign_key "time_entries", "categories"
  add_foreign_key "time_entries", "users"
end
