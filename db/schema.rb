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

ActiveRecord::Schema.define(version: 20180514053954) do

  create_table "admins", force: :cascade do |t|
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
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "areas", force: :cascade do |t|
    t.string "area_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "area_name_eng"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "student_id"
    t.integer "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "language_students", force: :cascade do |t|
    t.integer "student_id"
    t.integer "language_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "language_teachers", force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "language_id"
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
    t.string "report_reason"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "reported_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "student_id"
    t.integer "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0, null: false
    t.integer "send_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.text "detailed_place"
    t.integer "teacher_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.date "reservation_date"
    t.time "reservation_time"
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
    t.string "what_to_learn"
    t.string "other_language"
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
    t.string "detailed_place_1"
    t.string "detailed_place_2"
    t.string "detailed_place_3"
    t.string "need_to_bring"
    t.string "background"
    t.string "detailed_address_1"
    t.string "detailed_address_2"
    t.string "detailed_address_3"
    t.string "other_language"
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
    t.datetime "soft_destroyed_at"
    t.string "uid"
    t.string "provider"
    t.string "name"
    t.string "token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
