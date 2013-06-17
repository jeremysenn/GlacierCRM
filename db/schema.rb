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

ActiveRecord::Schema.define(:version => 20130617195523) do

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "document_url"
  end

  create_table "contacts", :force => true do |t|
    t.string   "title"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "suffix"
    t.string   "company"
    t.string   "department"
    t.string   "job_title"
    t.string   "business_street"
    t.string   "business_street_2"
    t.string   "business_street_3"
    t.string   "business_city"
    t.string   "business_state"
    t.string   "business_postal_code"
    t.string   "business_country_region"
    t.string   "home_street"
    t.string   "home_street_2"
    t.string   "home_street_3"
    t.string   "home_city"
    t.string   "home_state"
    t.string   "home_postal_code"
    t.string   "home_country_region"
    t.string   "other_street"
    t.string   "other_street_2"
    t.string   "other_street_3"
    t.string   "other_city"
    t.string   "other_state"
    t.string   "other_postal_code"
    t.string   "other_country_region"
    t.string   "assistant_phone"
    t.string   "business_fax"
    t.string   "business_phone"
    t.string   "business_phone_2"
    t.string   "home_fax"
    t.string   "home_phone"
    t.string   "home_phone_2"
    t.string   "mobile_phone"
    t.string   "other_fax"
    t.string   "other_phone"
    t.string   "primary_phone"
    t.date     "anniversary"
    t.string   "assistant_name"
    t.string   "billing_information"
    t.date     "birthday"
    t.string   "business_address_po_box"
    t.string   "categories"
    t.string   "children"
    t.string   "email"
    t.string   "email_display_name"
    t.string   "email_2"
    t.string   "email_2_display_name"
    t.string   "email_3"
    t.string   "email_3_display_name"
    t.text     "notes"
    t.string   "spouse"
    t.string   "webpage"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.integer  "user_id"
    t.string   "document_url"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.integer  "company_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
