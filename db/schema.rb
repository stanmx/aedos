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

ActiveRecord::Schema.define(:version => 20110321020421) do

  create_table "cities", :force => true do |t|
    t.integer  "state_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "destination_images", :force => true do |t|
    t.integer  "destination_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "destinations", :force => true do |t|
    t.integer  "city_id"
    t.text     "description"
    t.text     "attractions"
    t.text     "gastronomy"
    t.text     "recommendations"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fiscals", :force => true do |t|
    t.integer  "hotel_id"
    t.string   "business_name"
    t.string   "commercial_name"
    t.string   "rfc"
    t.string   "direction"
    t.string   "contact_name"
    t.string   "job_position"
    t.string   "phone"
    t.string   "email"
    t.text     "bank_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hotel_images", :force => true do |t|
    t.integer  "hotel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "hotels", :force => true do |t|
    t.integer  "city_id"
    t.boolean  "status"
    t.string   "name"
    t.text     "description"
    t.string   "direction"
    t.string   "location"
    t.string   "gmap"
    t.text     "services"
    t.integer  "category"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "infant_start_age"
    t.integer  "infant_end_age"
    t.integer  "minor_start_age"
    t.integer  "minor_end_age"
    t.integer  "junior_start_age"
    t.integer  "junior_end_age"
  end

  create_table "rates", :force => true do |t|
    t.integer  "room_id"
    t.decimal  "simple_rate"
    t.decimal  "double_rate"
    t.decimal  "triple_rate"
    t.decimal  "quad_rate"
    t.decimal  "quintuple_rate"
    t.decimal  "sextuple_rate"
    t.decimal  "infant_rate"
    t.decimal  "minor_rate"
    t.decimal  "junior_rate"
    t.decimal  "minor_breakfast"
    t.decimal  "adult_breakfast"
    t.decimal  "aeto_comission"
    t.decimal  "tax"
    t.decimal  "ish"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "rates_expired"
    t.integer  "min_days"
  end

  create_table "room_availabilities", :force => true do |t|
    t.integer  "room_id"
    t.date     "date"
    t.decimal  "package_price"
    t.decimal  "one_person_price"
    t.integer  "rooms_number"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "room_searches", :force => true do |t|
    t.integer  "adults_number"
    t.integer  "minors_number"
    t.integer  "minors_ages"
    t.integer  "search_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", :force => true do |t|
    t.integer  "hotel_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "capacity"
    t.integer  "rooms_number"
    t.integer  "adult_max_capacity"
    t.integer  "child_max_capacity"
    t.integer  "junior_max_capacity"
  end

  create_table "searches", :force => true do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
