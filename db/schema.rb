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

ActiveRecord::Schema.define(:version => 20111227052747) do

  create_table "admin_users", :force => true do |t|
    t.string    "login",        :limit => 45,                 :null => false
    t.string    "password",     :limit => 45,                 :null => false
    t.integer   "plan",                                       :null => false
    t.string    "name",         :limit => 45
    t.string    "mail_address", :limit => 45
    t.string    "url",          :limit => 800
    t.timestamp "created"
    t.integer   "delete_flag",  :limit => 1,   :default => 0
    t.string    "document",     :limit => 45
  end

  create_table "admin_users_requests", :force => true do |t|
    t.text      "data",     :limit => 2147483647, :null => false
    t.timestamp "created",                        :null => false
    t.string    "rand_key", :limit => 45
  end

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "contact_type"
    t.string   "plans"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mast_areas", :id => false, :force => true do |t|
    t.integer "id",                               :null => false
    t.string  "name",               :limit => 45
    t.string  "created",            :limit => 45
    t.integer "mast_prefecture_id",               :null => false
  end

  add_index "mast_areas", ["mast_prefecture_id"], :name => "fk_mast_areas_mast_prefectures1"

  create_table "mast_job_types", :force => true do |t|
    t.string    "name",    :limit => 45
    t.timestamp "created"
  end

  create_table "mast_play_categories", :force => true do |t|
    t.string    "name",    :limit => 45
    t.timestamp "created"
  end

  create_table "mast_prefectures", :force => true do |t|
    t.string    "name",    :limit => 45
    t.timestamp "created"
  end

  create_table "prefecture_mappings", :id => false, :force => true do |t|
    t.integer "id",                                :null => false
    t.string  "param",               :limit => 45
    t.integer "mast_prefectures_id",               :null => false
  end

  add_index "prefecture_mappings", ["mast_prefectures_id"], :name => "fk_prefecture_mappings_mast_prefectures1"

  create_table "shop_infos", :force => true do |t|
    t.string    "name",                          :limit => 45
    t.string    "address",                       :limit => 200
    t.string    "tel",                           :limit => 45
    t.string    "open",                          :limit => 45
    t.string    "close",                         :limit => 45
    t.integer   "price"
    t.string    "shop_url",                      :limit => 200
    t.timestamp "created"
    t.integer   "mast_areas_id"
    t.integer   "mast_areas_mast_prefecture_id"
    t.integer   "mast_job_types_id"
    t.integer   "admin_users_id"
  end

  add_index "shop_infos", ["mast_areas_id", "mast_areas_mast_prefecture_id"], :name => "fk_shop_infos_mast_areas1"
  add_index "shop_infos", ["mast_job_types_id"], :name => "fk_shop_infos_mast_job_types1"

  create_table "shop_play_categories", :id => false, :force => true do |t|
    t.integer "id",                      :null => false
    t.integer "shop_infos_id",           :null => false
    t.integer "mast_play_categories_id", :null => false
  end

  add_index "shop_play_categories", ["mast_play_categories_id"], :name => "fk_shop_play_categories_mast_play_categories1"
  add_index "shop_play_categories", ["shop_infos_id"], :name => "fk_shop_play_categories_shop_infos1"

  create_table "tmp_img_logs", :force => true do |t|
    t.string    "file_name", :limit => 1000
    t.timestamp "created",                   :null => false
  end

end
