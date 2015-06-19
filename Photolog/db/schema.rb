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

ActiveRecord::Schema.define(version: 20150619021131) do

  create_table "administradors", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.string   "password",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "calificacions", force: :cascade do |t|
    t.integer  "puntuacion", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "comentarios", force: :cascade do |t|
    t.datetime "fecha_comentario"
    t.text     "texto_comentario", limit: 65535
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "fotos", force: :cascade do |t|
    t.datetime "fecha_foto"
    t.text     "descripcion",   limit: 65535
    t.integer  "n_comentarios", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "apodo",      limit: 255
    t.string   "password",   limit: 255
    t.string   "nombre",     limit: 255
    t.string   "apellido",   limit: 255
    t.integer  "edad",       limit: 4
    t.string   "email",      limit: 255
    t.integer  "n_fotos",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
