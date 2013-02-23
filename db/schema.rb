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

ActiveRecord::Schema.define(:version => 20130218194453) do

  create_table "users", :force => true do |t|
    t.string   "first_name",                                            :null => false
    t.string   "last_name",                                             :null => false
    t.string   "phone_number"
    t.string   "login",               :limit => 20,                     :null => false
    t.string   "email",               :limit => 100,                    :null => false
    t.string   "crypted_password",                                      :null => false
    t.string   "password_salt",                                         :null => false
    t.string   "persistence_token",                                     :null => false
    t.string   "single_access_token",                                   :null => false
    t.string   "perishable_token",                                      :null => false
    t.integer  "login_count",                        :default => 0,     :null => false
    t.integer  "failed_login_count",                 :default => 0,     :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "password_reset_at"
    t.datetime "email_confimred_at"
    t.datetime "tos_agreed_at"
    t.boolean  "admin",                              :default => false
    t.boolean  "moderator",                          :default => false
    t.boolean  "event_coord",                        :default => false
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
