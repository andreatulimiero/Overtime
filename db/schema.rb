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

ActiveRecord::Schema.define(version: 20180531103629) do

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "content"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.integer  "discussion_id"
  end

  add_index "comments", ["discussion_id"], name: "index_comments_on_discussion_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "discussion_downvotes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "discussion_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "discussion_downvotes", ["discussion_id"], name: "index_discussion_downvotes_on_discussion_id"
  add_index "discussion_downvotes", ["user_id"], name: "index_discussion_downvotes_on_user_id"

  create_table "discussion_stars", force: :cascade do |t|
    t.integer  "discussion_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "discussion_stars", ["discussion_id"], name: "index_discussion_stars_on_discussion_id"
  add_index "discussion_stars", ["user_id"], name: "index_discussion_stars_on_user_id"

  create_table "discussion_upvotes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "discussion_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "discussion_upvotes", ["discussion_id"], name: "index_discussion_upvotes_on_discussion_id"
  add_index "discussion_upvotes", ["user_id"], name: "index_discussion_upvotes_on_user_id"

  create_table "discussions", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "discussions", ["user_id"], name: "index_discussions_on_user_id"

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

# Could not dump table "users" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

end
