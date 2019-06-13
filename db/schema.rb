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

ActiveRecord::Schema.define(version: 2019_05_31_170806) do



  create_table "answers", force: :cascade do |t|
    t.string "body", null: false
    t.integer "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "correct", default: false
    t.integer "user_id", null: false

  create_table "answers", force: :cascade do |t|
    t.text "body", null: false
    t.integer "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "correct"
    t.integer "user_id"

  end

  create_table "categories", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|

    t.string "body", null: false
    t.integer "level", default: 0

    t.text "body", null: false
    t.integer "level", default: 0, null: false

    t.integer "test_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end


  create_table "role_users", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false

  create_table "tests", force: :cascade do |t|
    t.string "title", null: false
    t.integer "level", default: 0, null: false
    t.integer "category_id", null: false

    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end


  create_table "test_authors", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "test_id", null: false
  end

  create_table "test_passages", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "test_id", null: false
    t.datetime "begin_at", null: false
    t.datetime "end_at"
    t.boolean "evaluation", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tests", force: :cascade do |t|
    t.string "title", null: false
    t.integer "level", default: 0
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false

  create_table "test_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "test_id", null: false
    t.index ["test_id", "user_id"], name: "index_tests_users_on_test_id_and_user_id"
    t.index ["user_id", "test_id"], name: "index_tests_users_on_user_id_and_test_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
