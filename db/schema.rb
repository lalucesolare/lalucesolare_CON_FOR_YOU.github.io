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

ActiveRecord::Schema.define(version: 20180824130947) do

  create_table "buskings", force: :cascade do |t|
    t.date     "day"
    t.string   "place"
    t.string   "name"
    t.string   "image"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ccpers", force: :cascade do |t|
    t.text     "content"
    t.integer  "comment_per_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "ccpers", ["comment_per_id"], name: "index_ccpers_on_comment_per_id"
  add_index "ccpers", ["user_id"], name: "index_ccpers_on_user_id"

  create_table "comment_buskings", force: :cascade do |t|
    t.string   "content"
    t.integer  "busking_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comment_buskings", ["busking_id"], name: "index_comment_buskings_on_busking_id"

  create_table "comment_comus", force: :cascade do |t|
    t.string   "content"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comment_comus", ["post_id"], name: "index_comment_comus_on_post_id"

  create_table "comment_pers", force: :cascade do |t|
    t.string   "content"
    t.integer  "performance_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "comment_pers", ["performance_id"], name: "index_comment_pers_on_performance_id"

  create_table "comment_photos", force: :cascade do |t|
    t.text     "content"
    t.integer  "photo_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comment_photos", ["photo_id"], name: "index_comment_photos_on_photo_id"

  create_table "comment_tips", force: :cascade do |t|
    t.string   "content"
    t.integer  "tip_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comment_tips", ["tip_id"], name: "index_comment_tips_on_tip_id"

  create_table "comment_videos", force: :cascade do |t|
    t.text     "content"
    t.integer  "video_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comment_videos", ["video_id"], name: "index_comment_videos_on_video_id"

  create_table "comments", force: :cascade do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.string   "title"
    t.text     "body"
    t.string   "subject"
    t.integer  "user_id",          null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "likebuskings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "busking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likebuskings", ["busking_id"], name: "index_likebuskings_on_busking_id"
  add_index "likebuskings", ["user_id"], name: "index_likebuskings_on_user_id"

  create_table "likepers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "performance_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "likepers", ["performance_id"], name: "index_likepers_on_performance_id"
  add_index "likepers", ["user_id"], name: "index_likepers_on_user_id"

  create_table "likephotos", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "photo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likephotos", ["photo_id"], name: "index_likephotos_on_photo_id"
  add_index "likephotos", ["user_id"], name: "index_likephotos_on_user_id"

  create_table "likes", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likes", ["post_id"], name: "index_likes_on_post_id"
  add_index "likes", ["user_id"], name: "index_likes_on_user_id"

  create_table "liketips", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "tip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "liketips", ["tip_id"], name: "index_liketips_on_tip_id"
  add_index "liketips", ["user_id"], name: "index_liketips_on_user_id"

  create_table "likevideos", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "video_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likevideos", ["user_id"], name: "index_likevideos_on_user_id"
  add_index "likevideos", ["video_id"], name: "index_likevideos_on_video_id"

  create_table "mailposts", force: :cascade do |t|
    t.string   "title"
    t.string   "email"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "performance_likes", force: :cascade do |t|
    t.integer  "performance_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "performance_likes", ["performance_id"], name: "index_performance_likes_on_performance_id"
  add_index "performance_likes", ["user_id"], name: "index_performance_likes_on_user_id"

  create_table "performances", force: :cascade do |t|
    t.date     "day"
    t.string   "title"
    t.string   "image"
    t.string   "second"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string   "title"
    t.string   "image"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "searchdates", force: :cascade do |t|
    t.date     "day"
    t.string   "title"
    t.string   "image"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "signups", force: :cascade do |t|
    t.string   "post"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tests", force: :cascade do |t|
    t.string   "title"
    t.string   "image"
    t.text     "content"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "apple_file_name"
    t.string   "apple_content_type"
    t.integer  "apple_file_size"
    t.datetime "apple_updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "tips", force: :cascade do |t|
    t.string   "title"
    t.string   "image"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "role"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "videos", force: :cascade do |t|
    t.string   "title"
    t.string   "image"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
