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

ActiveRecord::Schema.define(:version => 20130928050419) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "date"
    t.integer  "place_id"
    t.integer  "cover"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "instagram_services", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "body"
  end

  create_table "places", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.integer  "category_id"
    t.integer  "order"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "humanize_date"
    t.text     "body"
  end

  create_table "screams", :force => true do |t|
    t.string   "body"
    t.string   "owner"
    t.string   "media_url"
    t.string   "provider"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "tag"
    t.string   "owner_media_url"
  end

  create_table "tags", :force => true do |t|
    t.string   "tag"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "taggeable_id"
    t.string   "taggeable_type"
  end

  create_table "twitter_services", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
