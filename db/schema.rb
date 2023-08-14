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

ActiveRecord::Schema[7.0].define(version: 2023_07_27_062035) do
  create_table "characters", force: :cascade do |t|
    t.string "name", null: false
    t.text "slug", null: false, collation: "nocase"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_characters_on_slug", unique: true
  end

  create_table "quotes", force: :cascade do |t|
    t.text "text", null: false
    t.integer "character_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_quotes_on_character_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "slack_unique_id", null: false, collation: "nocase"
    t.string "slack_user_id", null: false
    t.string "slack_team_id", null: false
    t.string "avatar_url"
    t.datetime "admin_at"
    t.datetime "datetime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_at"], name: "index_users_on_admin_at"
    t.index ["slack_unique_id"], name: "index_users_on_slack_unique_id", unique: true
  end

  add_foreign_key "quotes", "characters", on_delete: :cascade
end
