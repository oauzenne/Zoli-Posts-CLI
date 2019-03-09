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

ActiveRecord::Schema.define(version: 20190305192802) do

  create_table "postcards", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.string  "category"
    t.string  "size"
    t.string  "deco"
    t.float   "cost"
    t.string  "message"
    t.index ["receiver_id"], name: "index_postcards_on_receiver_id"
    t.index ["sender_id"], name: "index_postcards_on_sender_id"
  end

  create_table "receivers", force: :cascade do |t|
    t.string "name"
    t.string "address"
  end

  create_table "senders", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.string "address"
    t.string "email"
  end

end
