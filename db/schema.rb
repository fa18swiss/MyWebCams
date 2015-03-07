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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150307162126) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "nom"
    t.integer  "idWebCam"
    t.integer  "webcam_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["webcam_id"], name: "index_categories_on_webcam_id", using: :btree

  create_table "comments", force: true do |t|
    t.string   "content"
    t.integer  "idUser"
    t.integer  "idWebCam"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "favoris", force: true do |t|
    t.string   "ordre"
    t.integer  "idUser"
    t.integer  "idWebCam"
    t.integer  "user_id"
    t.integer  "webcam_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favoris", ["user_id"], name: "index_favoris_on_user_id", using: :btree
  add_index "favoris", ["webcam_id"], name: "index_favoris_on_webcam_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "pseudo"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "webcams", force: true do |t|
    t.string   "nom"
    t.string   "url"
    t.float    "latitude"
    t.float    "longitude"
    t.float    "orientation"
    t.integer  "idUser"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "webcams", ["user_id"], name: "index_webcams_on_user_id", using: :btree

end
