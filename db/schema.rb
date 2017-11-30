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

ActiveRecord::Schema.define(version: 20171126063717) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "objectives", default: [], array: true
    t.jsonb "sections", default: [], array: true
    t.jsonb "exam", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["description"], name: "index_courses_on_description"
    t.index ["exam"], name: "index_courses_on_exam"
    t.index ["name"], name: "index_courses_on_name"
    t.index ["objectives"], name: "index_courses_on_objectives"
    t.index ["sections"], name: "index_courses_on_sections"
  end

  create_table "gamification_goals", id: :serial, force: :cascade do |t|
    t.string "rewarding_type"
    t.integer "rewarding_id"
    t.integer "points"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["rewarding_type", "rewarding_id"], name: "index_gamification_goals_on_rewarding_type_and_rewarding_id"
  end

  create_table "gamification_medals", id: :serial, force: :cascade do |t|
    t.integer "goal_id"
    t.string "name"
    t.string "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "description"
    t.index ["goal_id"], name: "index_gamification_medals_on_goal_id"
  end

  create_table "gamification_rewards", id: :serial, force: :cascade do |t|
    t.integer "goal_id"
    t.string "rewardable_type"
    t.integer "rewardable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "seen_at"
    t.index ["goal_id"], name: "index_gamification_rewards_on_goal_id"
    t.index ["rewardable_id", "rewardable_type"], name: "index_gamification_scorings_on_subjectable"
    t.index ["seen_at"], name: "index_gamification_rewards_on_seen_at"
  end

  create_table "inscriptions", force: :cascade do |t|
    t.bigint "course_id"
    t.boolean "assigned"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["course_id"], name: "index_inscriptions_on_course_id"
  end

  create_table "roles", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "you_do"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "name"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
  end

end
