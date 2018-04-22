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

ActiveRecord::Schema.define(version: 20180421111959) do

  create_table "areas", force: :cascade do |t|
    t.integer "area_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "count"
    t.text "comment"
    t.integer "teacher_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "language_students", force: :cascade do |t|
    t.integer "student_id"
    t.integer "language_id"
    t.integer "language_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "language_teachers", force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "language_id"
    t.integer "language_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "other_language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "language_name"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "send_user_id"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "room_id"
  end

  create_table "reports", force: :cascade do |t|
    t.text "report_comment"
    t.integer "report_reason"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "student_id"
    t.integer "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0, null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.text "detailed_place"
    t.integer "teacher_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "student_id"
    t.integer "teacher_id"
    t.integer "send_user_id"
    t.integer "receiver_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.integer "user_id"
    t.integer "language_student_id"
    t.integer "budget"
    t.text "message"
    t.string "first_language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "language_teacher_id"
    t.integer "budget"
    t.integer "japanese_level"
    t.text "message"
    t.string "first_language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_areas", force: :cascade do |t|
    t.integer "user_id"
    t.integer "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.text "image_id"
    t.string "nationality"
    t.integer "gender"
    t.integer "age"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
