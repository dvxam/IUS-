<<<<<<< HEAD
# encoding: UTF-8
=======
# -*- encoding : utf-8 -*-
>>>>>>> 938ad83a72917b9e92e6e3e6490c6b5f1d9b83ea
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130121095727) do

  create_table "annexes", :force => true do |t|
    t.string   "label"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "annexes", ["user_id"], :name => "index_annexes_on_user_id"

  create_table "attachements", :force => true do |t|
    t.string   "label"
    t.string   "path"
    t.integer  "post_id"
    t.integer  "comment_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "attachements", ["comment_id"], :name => "index_attachements_on_comment_id"
  add_index "attachements", ["post_id"], :name => "index_attachements_on_post_id"

  create_table "class_rooms", :force => true do |t|
    t.string   "label"
    t.integer  "school_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "class_rooms", ["school_id"], :name => "index_class_rooms_on_school_id"

  create_table "comments", :force => true do |t|
    t.text     "content"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["post_id"], :name => "index_comments_on_post_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "folders", :force => true do |t|
    t.string   "label"
    t.string   "path"
    t.boolean  "isValidated"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "folders", ["user_id"], :name => "index_folders_on_user_id"

  create_table "posts", :force => true do |t|
    t.string   "subject"
    t.text     "content"
    t.integer  "class_room_id"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "sender_id"
    t.integer  "receiver_id"
  end

  add_index "posts", ["class_room_id"], :name => "index_posts_on_classRoom_id"
  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "posts_users", :id => false, :force => true do |t|
    t.integer "users_id"
    t.integer "posts_id"
  end

  create_table "schools", :force => true do |t|
    t.string   "label"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "label"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_types", :force => true do |t|
    t.string   "label"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "firstname"
    t.string   "avatar"
    t.string   "mail"
    t.string   "password"
    t.boolean  "is_validated"
    t.integer  "class_room_id"
    t.integer  "user_type_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
  end

  add_index "users", ["class_room_id"], :name => "index_users_on_classRoom_id"
  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"
  add_index "users", ["user_type_id"], :name => "index_users_on_userType_id"

end
