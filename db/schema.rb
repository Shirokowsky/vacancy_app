# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 3) do

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.string   "contact"
    t.boolean  "status"
    t.integer  "salary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.integer  "skillable_id"
    t.string   "skillable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "skills", ["skillable_type", "skillable_id"], name: "index_skills_on_skillable_type_and_skillable_id"

  create_table "vacancies", force: :cascade do |t|
    t.string   "title"
    t.datetime "expired"
    t.integer  "salary"
    t.string   "contact"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
