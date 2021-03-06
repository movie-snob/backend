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

ActiveRecord::Schema.define(version: 2019_10_29_133934) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "films", force: :cascade do |t|
    t.string "title"
    t.integer "year"
    t.string "director"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "state", default: 0
    t.string "poster"
    t.integer "movie_db_id"
    t.bigint "user_id"
    t.string "imdb_id"
    t.integer "runtime"
    t.index ["movie_db_id"], name: "index_films_on_movie_db_id"
    t.index ["user_id"], name: "index_films_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "film_id"
    t.date "date_watched"
    t.date "date_reviewed"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["film_id"], name: "index_reviews_on_film_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "online", default: false
    t.integer "gender"
  end

  add_foreign_key "films", "users"
  add_foreign_key "reviews", "films"
  add_foreign_key "reviews", "users"
end
