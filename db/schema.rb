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

ActiveRecord::Schema.define(version: 20161028142822) do

  create_table "dinners", force: :cascade do |t|
    t.string   "name"
    t.text     "discription"
    t.integer  "zip"
    t.string   "district"
    t.string   "address"
    t.decimal  "lat"
    t.decimal  "lng"
    t.string   "style"
    t.integer  "price_level"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["name"], name: "index_dinners_on_name"
  end

end
