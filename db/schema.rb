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

ActiveRecord::Schema.define(version: 20151216004609) do

  create_table "blog_posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "author"
    t.string   "status"
    t.string   "feature_image"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.string   "author"
    t.string   "status"
    t.integer  "blog_post_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "page_id"
  end

  add_index "comments", ["blog_post_id"], name: "index_comments_on_blog_post_id"
  add_index "comments", ["page_id"], name: "index_comments_on_page_id"

  create_table "images", force: :cascade do |t|
    t.string   "file"
    t.integer  "blog_post_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "page_id"
  end

  add_index "images", ["blog_post_id"], name: "index_images_on_blog_post_id"
  add_index "images", ["page_id"], name: "index_images_on_page_id"

  create_table "navigations", force: :cascade do |t|
    t.string   "link"
    t.string   "title"
    t.integer  "order"
    t.boolean  "new_tab"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", force: :cascade do |t|
    t.boolean  "comments_approval"
    t.boolean  "comments_only_registered"
    t.boolean  "new_user_signups"
    t.string   "site_title"
    t.text     "site_description"
    t.string   "timezone"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "blog_post_id"
    t.integer  "tag_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "page_id"
  end

  add_index "taggings", ["blog_post_id"], name: "index_taggings_on_blog_post_id"
  add_index "taggings", ["page_id"], name: "index_taggings_on_page_id"
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id"

  create_table "tags", force: :cascade do |t|
    t.string   "topic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
