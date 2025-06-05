# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_06_05_114555) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accessory_products", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "tipo"
    t.string "subtipo"
    t.string "condition"
    t.string "material"
    t.string "color"
    t.integer "precio"
    t.float "distancia"
    t.string "status"
    t.string "tags"
    t.string "owner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uso"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "clothing_products", force: :cascade do |t|
    t.string "nombre"
    t.text "descripcion"
    t.integer "precio"
    t.string "genero"
    t.string "estado"
    t.string "talle"
    t.string "talle_zapatilla"
    t.string "owner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "furniture_products", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "tipo"
    t.string "subtipo"
    t.string "condition"
    t.string "material"
    t.string "color"
    t.integer "precio"
    t.float "distancia"
    t.string "status"
    t.string "tags"
    t.string "owner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kids_products", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "tipo"
    t.string "subtipo"
    t.string "edad"
    t.string "talle_ropa"
    t.string "talle_zapatilla"
    t.integer "precio"
    t.float "distancia"
    t.string "condition"
    t.string "material"
    t.string "color"
    t.string "status"
    t.string "tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "owner"
  end

  create_table "orders", force: :cascade do |t|
    t.string "email"
    t.integer "quantity"
    t.decimal "total_amount"
    t.string "status"
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_orders_on_product_id"
  end

  create_table "other_products", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "tipo"
    t.string "subtipo"
    t.integer "precio"
    t.float "distancia"
    t.string "condition"
    t.string "material"
    t.string "color"
    t.string "status"
    t.string "tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "owner"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "tipo"
    t.string "subtipo"
    t.string "condition"
    t.string "material"
    t.string "color"
    t.string "talle_ropa"
    t.string "talle_zapatilla"
    t.integer "precio"
    t.integer "distancia"
    t.integer "width"
    t.integer "height"
    t.integer "depth"
    t.string "status"
    t.string "tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "edad"
    t.string "medidas"
    t.string "owner"
    t.string "uso"
    t.string "genero"
  end

  create_table "uniform_products", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "tipo"
    t.string "subtipo"
    t.string "colegio"
    t.string "talle_ropa"
    t.string "talle_zapatilla"
    t.integer "precio"
    t.float "distancia"
    t.string "condition"
    t.string "material"
    t.string "color"
    t.string "status"
    t.string "tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "owner"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "orders", "products"
end
