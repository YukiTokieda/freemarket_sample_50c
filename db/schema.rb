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

ActiveRecord::Schema.define(version: 20190516171936) do

  create_table "brand_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_brand_groups_on_name", unique: true, using: :btree
  end

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "brand_group_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["brand_group_id"], name: "index_brands_on_brand_group_id", using: :btree
    t.index ["name"], name: "index_brands_on_name", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",           null: false
    t.integer  "parent_id"
    t.integer  "grandparent_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["grandparent_id"], name: "index_categories_on_grandparent_id", using: :btree
    t.index ["parent_id"], name: "index_categories_on_parent_id", using: :btree
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "url",        limit: 65535, null: false
    t.integer  "product_id",               null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["product_id"], name: "index_images_on_product_id", using: :btree
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                                   null: false
    t.bigint   "price",                                  null: false
    t.text     "description", limit: 65535,              null: false
    t.string   "brand",                     default: ""
    t.integer  "shipping_id",                            null: false
    t.integer  "category_id",                            null: false
    t.integer  "size_id",                                null: false
    t.integer  "state_id",                               null: false
    t.integer  "status_id",                 default: 1,  null: false
    t.integer  "user_id",                                null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
    t.index ["name"], name: "index_products_on_name", using: :btree
    t.index ["shipping_id"], name: "index_products_on_shipping_id", using: :btree
    t.index ["size_id"], name: "index_products_on_size_id", using: :btree
    t.index ["state_id"], name: "index_products_on_state_id", using: :btree
    t.index ["status_id"], name: "index_products_on_status_id", using: :btree
    t.index ["user_id"], name: "index_products_on_user_id", using: :btree
  end

  create_table "profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "body",            limit: 65535
    t.string   "first_name"
    t.string   "last_name"
    t.string   "first_name_kana"
    t.string   "last_name_kana"
    t.string   "birth_year"
    t.string   "birth_month"
    t.string   "birth_day"
    t.bigint   "phone_number"
    t.integer  "zipcode"
    t.integer  "prefecture"
    t.string   "city"
    t.string   "district"
    t.string   "building"
    t.integer  "user_id",                       null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["user_id"], name: "index_profiles_on_user_id", unique: true, using: :btree
  end

  create_table "shippings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "method",                 null: false
    t.string   "prefecture_from",        null: false
    t.string   "period_before_shipping", null: false
    t.string   "fee_burden",             null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "sizes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_sizes_on_name", unique: true, using: :btree
  end

  create_table "sns_credentials", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "uid",                      null: false
    t.string   "provider",                 null: false
    t.text     "token",      limit: 65535
    t.integer  "user_id",                  null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["user_id"], name: "index_sns_credentials_on_user_id", using: :btree
  end

  create_table "states", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_states_on_name", unique: true, using: :btree
  end

  create_table "statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_statuses_on_name", unique: true, using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nickname",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "brands", "brand_groups"
  add_foreign_key "images", "products"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "shippings"
  add_foreign_key "products", "sizes"
  add_foreign_key "products", "states"
  add_foreign_key "products", "statuses"
  add_foreign_key "products", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "sns_credentials", "users"
end
