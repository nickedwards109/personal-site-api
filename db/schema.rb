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

ActiveRecord::Schema.define(version: 2019_03_02_225259) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "images", force: :cascade do |t|
    t.string "url"
    t.integer "order_index"
    t.bigint "section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_id"], name: "index_images_on_section_id"
  end

  create_table "links", force: :cascade do |t|
    t.string "url"
    t.integer "order_index"
    t.bigint "paragraph_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["paragraph_id"], name: "index_links_on_paragraph_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "paragraphs", force: :cascade do |t|
    t.integer "order_index"
    t.bigint "section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_id"], name: "index_paragraphs_on_section_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "alignment", default: 0
    t.integer "number_of_left_aligned_elements"
    t.integer "page_id"
  end

  create_table "sentence_groups", force: :cascade do |t|
    t.text "copy"
    t.integer "order_index"
    t.bigint "paragraph_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["paragraph_id"], name: "index_sentence_groups_on_paragraph_id"
  end

  add_foreign_key "images", "sections"
  add_foreign_key "links", "paragraphs"
  add_foreign_key "paragraphs", "sections"
  add_foreign_key "sentence_groups", "paragraphs"
end
