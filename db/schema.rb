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

ActiveRecord::Schema.define(version: 20180327212513) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "description"
    t.string "street"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_addresses_on_student_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "student_course_id"
    t.index ["student_course_id"], name: "index_courses_on_student_course_id"
  end

  create_table "student_courses", force: :cascade do |t|
    t.bigint "students_id"
    t.bigint "courses_id"
    t.index ["courses_id"], name: "index_student_courses_on_courses_id"
    t.index ["students_id"], name: "index_student_courses_on_students_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "student_course_id"
    t.index ["student_course_id"], name: "index_students_on_student_course_id"
  end

  add_foreign_key "addresses", "students"
  add_foreign_key "courses", "student_courses"
  add_foreign_key "students", "student_courses"
end
