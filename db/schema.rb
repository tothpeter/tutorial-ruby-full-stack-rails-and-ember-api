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

ActiveRecord::Schema.define(version: 20160328121506) do

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "website"
    t.text     "address"
    t.string   "customer_id"
    t.string   "additional_info"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "family_name"
    t.string   "given_names"
    t.integer  "company_id"
    t.string   "title"
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "website"
    t.text     "address"
    t.string   "customer_id"
    t.string   "additional_info"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "contacts", ["company_id"], name: "index_contacts_on_company_id"

  create_table "contacts_offers", force: :cascade do |t|
    t.integer "contact_id"
    t.integer "offer_id"
  end

  add_index "contacts_offers", ["contact_id"], name: "index_contacts_offers_on_contact_id"
  add_index "contacts_offers", ["offer_id"], name: "index_contacts_offers_on_offer_id"

  create_table "contacts_projects", force: :cascade do |t|
    t.integer "contact_id"
    t.integer "project_id"
  end

  add_index "contacts_projects", ["contact_id"], name: "index_contacts_projects_on_contact_id"
  add_index "contacts_projects", ["project_id"], name: "index_contacts_projects_on_project_id"

  create_table "notes", force: :cascade do |t|
    t.string   "type"
    t.string   "title"
    t.text     "description"
    t.integer  "contact_id"
    t.integer  "topic_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "notes", ["contact_id"], name: "index_notes_on_contact_id"
  add_index "notes", ["topic_id"], name: "index_notes_on_topic_id"

  create_table "offers", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "name"
    t.float    "price"
    t.integer  "status"
    t.datetime "valid_until"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "offers", ["project_id"], name: "index_offers_on_project_id"

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.integer  "status",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "description"
    t.integer  "status",      default: 0
    t.integer  "project_id"
    t.datetime "due_at"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "tasks", ["project_id"], name: "index_tasks_on_project_id"

end
