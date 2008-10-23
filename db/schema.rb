# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20081022193407) do

  create_table "dynamic_stories", :force => true do |t|
    t.string   "css_id"
    t.text     "summary_p_content"
    t.text     "p_content"
    t.datetime "expiration_date_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sidebar_content"
  end

  create_table "four_oh_fours", :force => true do |t|
    t.string   "url"
    t.string   "referer"
    t.integer  "count",      :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "four_oh_fours", ["url", "referer"], :name => "index_four_oh_fours_on_url_and_referer", :unique => true
  add_index "four_oh_fours", ["url"], :name => "index_four_oh_fours_on_url"

  create_table "images", :force => true do |t|
    t.string  "content_type"
    t.string  "filename"
    t.integer "size"
    t.integer "parent_id"
    t.string  "thumbnail"
    t.integer "width"
    t.integer "height"
    t.integer "db_file_id"
    t.integer "owner_id"
    t.string  "owner_type"
  end

  create_table "invitations", :force => true do |t|
    t.integer  "sender_id"
    t.string   "email"
    t.string   "token"
    t.datetime "sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invitations", ["token"], :name => "index_invitations_on_token", :unique => true

  create_table "logged_exceptions", :force => true do |t|
    t.string   "exception_class"
    t.string   "controller_name"
    t.string   "action_name"
    t.text     "message"
    t.text     "backtrace"
    t.text     "environment"
    t.text     "request"
    t.datetime "created_at"
  end

  create_table "open_id_authentication_associations", :force => true do |t|
    t.integer "issued"
    t.integer "lifetime"
    t.string  "handle"
    t.string  "assoc_type"
    t.binary  "server_url"
    t.binary  "secret"
  end

  create_table "open_id_authentication_nonces", :force => true do |t|
    t.integer "timestamp",                  :null => false
    t.string  "server_url"
    t.string  "salt",       :default => "", :null => false
  end

  create_table "payments", :force => true do |t|
    t.float    "amount"
    t.string   "email"
    t.string   "name"
    t.integer  "confirmation"
    t.string   "payment_method"
    t.string   "description"
    t.string   "status"
    t.string   "test"
    t.boolean  "received"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rentables", :force => true do |t|
    t.string   "title"
    t.text     "details"
    t.text     "comments"
    t.boolean  "available"
    t.datetime "out_date_time"
    t.datetime "in_date_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id"], :name => "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "simple_stories", :force => true do |t|
    t.string   "h2_content"
    t.text     "p_content"
    t.datetime "expiration_date_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sidebar_content"
  end

  create_table "trip_enrollments", :force => true do |t|
    t.boolean  "rent",           :default => false
    t.string   "board_type"
    t.boolean  "suit",           :default => false
    t.string   "suit_size"
    t.string   "height"
    t.string   "weight"
    t.boolean  "gloves",         :default => false
    t.string   "glove_size"
    t.boolean  "hoody",          :default => false
    t.boolean  "hoody_size"
    t.boolean  "booties",        :default => false
    t.string   "booty_size"
    t.string   "shoe_size_type"
    t.boolean  "driver",         :default => false
    t.integer  "car_capacity"
    t.boolean  "tent",           :default => false
    t.integer  "tent_capacity"
    t.boolean  "tarp",           :default => false
    t.boolean  "stove",          :default => false
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "trip_id"
    t.integer  "payment_id"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "know_suit_size"
    t.string   "phone"
    t.string   "email_address"
  end

  add_index "trip_enrollments", ["trip_id"], :name => "fk_trip_enrollments_trip_id"
  add_index "trip_enrollments", ["payment_id"], :name => "fk_trip_enrollments_payment_id"

  create_table "trips", :force => true do |t|
    t.float    "cost"
    t.datetime "start"
    t.datetime "end"
    t.text     "description"
    t.string   "meeting_location"
    t.string   "meeting_location_link"
    t.string   "location"
    t.string   "location_link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "camping"
    t.text     "embedded_location"
    t.text     "embedded_meeting"
    t.float    "board_rental_cost",              :default => 0.0
    t.float    "booty_rental_cost",              :default => 0.0
    t.float    "glove_rental_cost",              :default => 0.0
    t.float    "suit_rental_cost",               :default => 0.0
    t.float    "total_rental_cost",              :default => 0.0
    t.float    "driver_discount",                :default => 0.0
    t.string   "title"
    t.string   "trip_meeting_location_map_link"
    t.string   "trip_location_map_link"
    t.string   "sidebar_content"
  end

  create_table "user_failures", :force => true do |t|
    t.string   "remote_ip"
    t.string   "http_user_agent"
    t.string   "failure_type"
    t.string   "username"
    t.integer  "count",           :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_failures", ["remote_ip"], :name => "index_user_failures_on_remote_ip"

  create_table "users", :force => true do |t|
    t.string   "user_type"
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "password_reset_code",       :limit => 40
    t.boolean  "enabled",                                  :default => true
    t.string   "identity_url"
    t.integer  "invitation_id"
    t.integer  "invitation_limit"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
