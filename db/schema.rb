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

ActiveRecord::Schema.define(version: 20170108082608) do

  create_table "comments", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "suggestion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupon_tracks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "dinner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dinners", force: :cascade do |t|
    t.string   "name"
    t.text     "discription"
    t.integer  "zip"
    t.string   "district"
    t.string   "address"
    t.decimal  "lat"
    t.decimal  "lng"
    t.integer  "price_level"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "place_id"
    t.float    "rating"
    t.integer  "style_id"
    t.string   "phone_number",   default: " "
    t.string   "onsale",         default: "false"
    t.string   "onsale_content", default: "not on sale"
    t.index ["name"], name: "index_dinners_on_name"
  end

  create_table "meals", force: :cascade do |t|
    t.string   "dinner_id"
    t.string   "name"
    t.text     "discription"
    t.integer  "price"
    t.integer  "style_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "calories",                  default: 0
    t.integer  "user_meal_likeships_count", default: 0
    t.index ["name"], name: "index_meals_on_name"
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "phototable_id"
    t.string   "phototable_type"
    t.string   "name"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "styles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_meal_likeships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "meal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "fb_uid"
    t.string   "fb_token"
    t.string   "authentication_token"
    t.string   "role",                   default: "normal"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["fb_uid"], name: "index_users_on_fb_uid"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
