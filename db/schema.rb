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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130104205516) do

  create_table "activities", :force => true do |t|
    t.text     "activity"
    t.integer  "period_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "attachments", :force => true do |t|
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.integer  "lesson_id"
    t.integer  "lesson_template_id"
  end

  create_table "cloned_lesson_users", :force => true do |t|
    t.integer  "lesson_clone_id"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "day_lessons", :force => true do |t|
    t.integer  "day_id"
    t.integer  "lesson_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "days", :force => true do |t|
    t.datetime "date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "day_value"
    t.integer  "semester_id"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "images", :force => true do |t|
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "lesson_id"
    t.integer  "lesson_template_id"
  end

  create_table "lesson_clones", :force => true do |t|
    t.integer  "lesson_id"
    t.string   "summary"
    t.text     "description"
    t.text     "short_description"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "lesson_days", :force => true do |t|
    t.integer  "day_value"
    t.integer  "semester_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "lesson_teachers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "lesson_id"
    t.boolean  "confirmed"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lesson_template_tracks", :force => true do |t|
    t.integer  "lesson_template_id"
    t.integer  "track_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "lesson_templates", :force => true do |t|
    t.string   "start_time"
    t.string   "end_time"
    t.string   "title"
    t.text     "overview"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lesson_tracks", :force => true do |t|
    t.integer  "lesson_id"
    t.integer  "track_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lesson_users", :force => true do |t|
    t.integer  "lesson_id"
    t.integer  "user_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "assigned",   :default => false
    t.boolean  "confirmed",  :default => false
  end

  create_table "lessons", :force => true do |t|
    t.string   "summary"
    t.text     "description"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.integer  "lesson_day_id"
    t.text     "short_description"
    t.boolean  "save_template",     :default => false
    t.boolean  "assigned",          :default => false
  end

  create_table "objectives", :force => true do |t|
    t.string   "objective"
    t.integer  "lesson_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "lesson_template_id"
  end

  create_table "periods", :force => true do |t|
    t.string   "start_time"
    t.string   "end_time"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "lesson_id"
    t.integer  "lesson_template_id"
  end

  create_table "semesters", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.datetime "end_date"
    t.datetime "start_date"
  end

  create_table "tracks", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                     :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "admin",                  :default => false
    t.string   "name"
    t.string   "company"
    t.string   "remember_token"
    t.string   "password_digest"
    t.boolean  "request_recover",        :default => false
    t.datetime "expiration_time"
    t.string   "linked_in"
    t.string   "facebook"
    t.string   "twitter"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
