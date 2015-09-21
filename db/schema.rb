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

ActiveRecord::Schema.define(version: 4) do

  create_table "employees", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "contact",                   null: false
    t.boolean  "status",     default: true, null: false
    t.integer  "salary",     default: 0,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employees", ["name"], name: "index_employees_on_name"

  create_table "skill_links", force: :cascade do |t|
    t.integer  "skill_id"
    t.integer  "skillable_id"
    t.string   "skillable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "skill_links", ["skillable_type", "skillable_id"], name: "index_skill_links_on_skillable_type_and_skillable_id"

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.integer  "skill_links_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vacancies", force: :cascade do |t|
    t.string   "title",                  null: false
    t.datetime "expired"
    t.integer  "salary",     default: 0, null: false
    t.string   "contact",                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vacancies", ["title"], name: "index_vacancies_on_title"

end
