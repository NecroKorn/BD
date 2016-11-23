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

ActiveRecord::Schema.define(version: 20161109231816) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "butaca_reservada", primary_key: "id_butaca", id: :integer, force: :cascade do |t|
    t.integer "id_reserva"
    t.integer "numero_butaca_reservada"
    t.index ["id_butaca"], name: "butaca_reservada_pk", unique: true, using: :btree
    t.index ["id_reserva"], name: "relationship_6_fk", using: :btree
  end

  create_table "calificacion_pelicula", primary_key: "id_calificacion_pelicula", id: :integer, force: :cascade do |t|
    t.string "nombre_calificacion_pelicula", limit: 100
    t.index ["id_calificacion_pelicula"], name: "calificacion_pelicula_pk", unique: true, using: :btree
  end

  create_table "calificacion_peliculas", force: :cascade do |t|
    t.integer  "id_calificacion_pelicula"
    t.string   "nombre_calificacion_pelicula"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "cine", primary_key: "id_cine", id: :integer, force: :cascade do |t|
    t.string "direccion",   limit: 100
    t.string "nombre_cine", limit: 100
    t.index ["id_cine"], name: "cine_pk", unique: true, using: :btree
  end

  create_table "funcion", primary_key: "id_funcion", id: :integer, force: :cascade do |t|
    t.integer "id_pelicula"
    t.integer "id_sala"
    t.date    "fecha_funcion"
    t.index ["id_funcion"], name: "funcion_pk", unique: true, using: :btree
    t.index ["id_pelicula"], name: "relationship_4_fk", using: :btree
    t.index ["id_sala"], name: "relationship_3_fk", using: :btree
  end

  create_table "genero_pelicula", primary_key: "id_genero_pelicula", id: :integer, force: :cascade do |t|
    t.string "nombre_genero", limit: 100
    t.index ["id_genero_pelicula"], name: "genero_pelicula_pk", unique: true, using: :btree
  end

  create_table "genero_peliculas", force: :cascade do |t|
    t.integer  "id_genero_pelicula"
    t.string   "nombre_genero"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "pelicula", primary_key: "id_pelicula", id: :integer, force: :cascade do |t|
    t.integer "id_calificacion_pelicula",             null: false
    t.integer "id_genero_pelicula",                   null: false
    t.integer "id_reparto"
    t.string  "titulo_distribucion",      limit: 100
    t.string  "titulo_original",          limit: 100
    t.string  "idioma_original",          limit: 100
    t.boolean "subtitulos_espanol"
    t.decimal "ano_produccion"
    t.integer "duracion_minutos"
    t.date    "fecha_estreno"
    t.string  "resumen",                  limit: 500
    t.index ["id_calificacion_pelicula"], name: "relationship_10_fk", using: :btree
    t.index ["id_genero_pelicula"], name: "relationship_11_fk", using: :btree
    t.index ["id_pelicula"], name: "pelicula_pk", unique: true, using: :btree
    t.index ["id_reparto"], name: "relationship_7_fk", using: :btree
  end

  create_table "persona", primary_key: "id_persona", id: :integer, force: :cascade do |t|
    t.string "nombre_persona",   limit: 100
    t.string "apellido_paterno", limit: 100
    t.string "apellido_materno", limit: 100
    t.index ["id_persona"], name: "persona_pk", unique: true, using: :btree
  end

  create_table "reparto", primary_key: "id_reparto", id: :integer, force: :cascade do |t|
    t.integer "id_persona"
    t.integer "id_rol_reparto"
    t.string  "nombre_personaje", limit: 100
    t.index ["id_persona"], name: "relationship_8_fk", using: :btree
    t.index ["id_reparto"], name: "reparto_pk", unique: true, using: :btree
    t.index ["id_rol_reparto"], name: "relationship_9_fk", using: :btree
  end

  create_table "reserva", primary_key: "id_reserva", id: :integer, force: :cascade do |t|
    t.integer "id_funcion"
    t.date    "fecha_reserva"
    t.boolean "vigente"
    t.date    "fecha_estado"
    t.index ["id_funcion"], name: "relationship_5_fk", using: :btree
    t.index ["id_reserva"], name: "reserva_pk", unique: true, using: :btree
  end

  create_table "rol_reparto", primary_key: "id_rol_reparto", id: :integer, force: :cascade do |t|
    t.string "nombre_rol", limit: 100
    t.index ["id_rol_reparto"], name: "rol_reparto_pk", unique: true, using: :btree
  end

  create_table "sala", primary_key: "id_sala", id: :integer, force: :cascade do |t|
    t.integer "id_cine"
    t.integer "numero_sala"
    t.integer "cantidad_butacas"
    t.index ["id_cine"], name: "relationship_2_fk", using: :btree
    t.index ["id_sala"], name: "sala_pk", unique: true, using: :btree
  end

  add_foreign_key "butaca_reservada", "reserva", column: "id_reserva", primary_key: "id_reserva", name: "fk_butaca_r_relations_reserva", on_update: :restrict, on_delete: :restrict
  add_foreign_key "funcion", "pelicula", column: "id_pelicula", primary_key: "id_pelicula", name: "fk_funcion_relations_pelicula", on_update: :restrict, on_delete: :restrict
  add_foreign_key "funcion", "sala", column: "id_sala", primary_key: "id_sala", name: "fk_funcion_relations_sala", on_update: :restrict, on_delete: :restrict
  add_foreign_key "pelicula", "calificacion_pelicula", column: "id_calificacion_pelicula", primary_key: "id_calificacion_pelicula", name: "fk_pelicula_relations_califica", on_update: :restrict, on_delete: :restrict
  add_foreign_key "pelicula", "genero_pelicula", column: "id_genero_pelicula", primary_key: "id_genero_pelicula", name: "fk_pelicula_relations_genero_p", on_update: :restrict, on_delete: :restrict
  add_foreign_key "pelicula", "reparto", column: "id_reparto", primary_key: "id_reparto", name: "fk_pelicula_relations_reparto", on_update: :restrict, on_delete: :restrict
  add_foreign_key "reparto", "persona", column: "id_persona", primary_key: "id_persona", name: "fk_reparto_relations_persona", on_update: :restrict, on_delete: :restrict
  add_foreign_key "reparto", "rol_reparto", column: "id_rol_reparto", primary_key: "id_rol_reparto", name: "fk_reparto_relations_rol_repa", on_update: :restrict, on_delete: :restrict
  add_foreign_key "reserva", "funcion", column: "id_funcion", primary_key: "id_funcion", name: "fk_reserva_relations_funcion", on_update: :restrict, on_delete: :restrict
  add_foreign_key "sala", "cine", column: "id_cine", primary_key: "id_cine", name: "fk_sala_relations_cine", on_update: :restrict, on_delete: :restrict
end
