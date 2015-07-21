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

ActiveRecord::Schema.define(version: 20150717043101) do

  create_table "calificacions", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "foto_id",    limit: 4
    t.integer  "puntuacion", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "calificacions", ["foto_id"], name: "index_calificacions_on_foto_id", using: :btree
  add_index "calificacions", ["user_id"], name: "index_calificacions_on_user_id", using: :btree

  create_table "coments", force: :cascade do |t|
    t.integer  "foto_id",          limit: 4
    t.integer  "user_id",          limit: 4
    t.date     "fecha_comentario"
    t.text     "texto_comentario", limit: 65535
    t.string   "anonimo",          limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "coments", ["foto_id"], name: "index_coments_on_foto_id", using: :btree
  add_index "coments", ["user_id"], name: "index_coments_on_user_id", using: :btree

  create_table "followers", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "seguido_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "fotos", force: :cascade do |t|
    t.integer  "user_id",             limit: 4
    t.datetime "fecha_foto"
    t.text     "descripcion",         limit: 65535
    t.integer  "n_comentarios",       limit: 4
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "imagen_file_name",    limit: 255
    t.string   "imagen_content_type", limit: 255
    t.integer  "imagen_file_size",    limit: 4
    t.datetime "imagen_updated_at"
    t.integer  "puntuacion_total",    limit: 4,     default: 0
  end

  add_index "fotos", ["user_id"], name: "index_fotos_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "name",                   limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "permission_level",       limit: 4,   default: 1
    t.integer  "fotos_diarias",          limit: 4,   default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "calificacions", "fotos"
  add_foreign_key "calificacions", "users"
  add_foreign_key "coments", "fotos"
  add_foreign_key "coments", "users"
  add_foreign_key "fotos", "users"
end
