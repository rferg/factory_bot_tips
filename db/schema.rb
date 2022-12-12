# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_221_212_204_032) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'authors', force: :cascade do |t|
    t.string 'first_name'
    t.string 'middle_name'
    t.string 'last_name', null: false
    t.integer 'year_of_birth', null: false
    t.integer 'year_of_death'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'books', force: :cascade do |t|
    t.string 'title', null: false
    t.string 'description'
    t.integer 'year_of_publication', null: false
    t.bigint 'author_id', null: false
    t.bigint 'publisher_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['author_id'], name: 'index_books_on_author_id'
    t.index ['publisher_id'], name: 'index_books_on_publisher_id'
  end

  create_table 'copies', force: :cascade do |t|
    t.bigint 'book_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['book_id'], name: 'index_copies_on_book_id'
  end

  create_table 'loans', force: :cascade do |t|
    t.bigint 'member_id', null: false
    t.bigint 'book_id', null: false
    t.bigint 'parent_id'
    t.datetime 'due_on', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['book_id'], name: 'index_loans_on_book_id'
    t.index ['member_id'], name: 'index_loans_on_member_id'
    t.index ['parent_id'], name: 'index_loans_on_parent_id'
  end

  create_table 'members', force: :cascade do |t|
    t.string 'first_name'
    t.string 'middle_name'
    t.string 'last_name', null: false
    t.boolean 'in_good_standing', default: true, null: false
    t.string 'phone_number'
    t.string 'email', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'publishers', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'city'
    t.string 'state'
    t.string 'country', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'books', 'authors'
  add_foreign_key 'books', 'publishers'
  add_foreign_key 'copies', 'books'
  add_foreign_key 'loans', 'books'
  add_foreign_key 'loans', 'loans', column: 'parent_id'
  add_foreign_key 'loans', 'members'
end
