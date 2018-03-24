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

ActiveRecord::Schema.define(version: 20180324010835) do

  create_table "active_admin_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "namespace"
    t.text     "body",          limit: 65535
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "app_settings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "setting"
    t.string   "value"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "distributions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "external_id"
    t.integer  "external_fund_id"
    t.integer  "external_organization_id"
    t.integer  "fund_id"
    t.integer  "organization_id"
    t.integer  "amount"
    t.date     "effective_date"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "donor_fund_relations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "donor_id"
    t.integer  "fund_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["donor_id"], name: "index_donor_fund_relations_on_donor_id", using: :btree
    t.index ["fund_id"], name: "index_donor_fund_relations_on_fund_id", using: :btree
  end

  create_table "donors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "external_id"
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
    t.string   "login_token"
    t.datetime "login_token_expires"
    t.index ["email"], name: "index_donors_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_donors_on_reset_password_token", unique: true, using: :btree
  end

  create_table "field_of_interests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "interest_id"
    t.string   "type"
    t.boolean  "liked"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "file_uploads", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "file_name"
    t.string   "upload_type"
    t.text     "file",        limit: 4294967295
    t.string   "status"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "funding_needs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "organization_id"
    t.text     "description",           limit: 65535
    t.string   "website"
    t.integer  "goal"
    t.date     "end_date",              null: false
    t.string   "image_url"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "raised"
    t.string   "primary_contact_name"
    t.string   "primary_contact_email"
    t.string   "primary_contact_phone"
    t.boolean  "approved"
  end

  create_table "funds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "external_id"
    t.integer  "spendable_balance"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "interests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "external_id"
    t.string   "category"
    t.string   "subcategory"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "organization_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "name"
    t.string   "external_id"
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
    t.index ["email"], name: "index_organization_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_organization_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "organizations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "external_id"
    t.string   "ein"
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
    t.string   "website"
    t.integer  "organization_user_id"
    t.index ["email"], name: "index_organizations_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_organizations_on_reset_password_token", unique: true, using: :btree
  end

end
