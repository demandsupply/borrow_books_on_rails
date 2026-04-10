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

ActiveRecord::Schema[8.1].define(version: 2026_04_10_101929) do
  create_table "books", force: :cascade do |t|
    t.string "author"
    t.datetime "created_at", null: false
    t.string "isbn"
    t.string "title"
    t.datetime "updated_at", null: false
  end

  create_table "copies", force: :cascade do |t|
    t.string "barcode"
    t.integer "book_id", null: false
    t.datetime "created_at", null: false
    t.integer "library_id", null: false
    t.string "status"
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_copies_on_book_id"
    t.index ["library_id"], name: "index_copies_on_library_id"
  end

  create_table "libraries", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "location"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "loans", force: :cascade do |t|
    t.integer "copy_id", null: false
    t.datetime "created_at", null: false
    t.datetime "ended_at"
    t.datetime "started_at"
    t.integer "status"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["copy_id"], name: "index_loans_on_copy_id"
    t.index ["user_id"], name: "index_loans_on_user_id"
  end

  add_foreign_key "copies", "books"
  add_foreign_key "copies", "libraries"
  add_foreign_key "loans", "copies"
  add_foreign_key "loans", "users"
end
