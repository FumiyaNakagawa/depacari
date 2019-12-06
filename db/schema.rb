# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_06_082549) do

  create_table "depacari_points", force: :cascade do |t|
    t.integer "user_id"
    t.integer "order_id"
    t.integer "point"
    t.string "string"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.integer "product_id"
    t.string "shipping_name"
    t.string "shipping_address"
    t.string "payment_method"
    t.integer "sold_user_id"
    t.string "product_name"
    t.integer "product_price"
    t.text "product_details"
    t.string "product_condition"
    t.datetime "product_cteated_at"
    t.datetime "product_updated_at"
    t.integer "tax"
    t.integer "use_depacari_point"
    t.integer "total_amont"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "product_images", force: :cascade do |t|
    t.integer "product_id"
    t.string "image"
    t.integer "order_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.text "details"
    t.integer "price"
    t.string "condition"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.integer "phone_number"
    t.string "email"
    t.string "name"
    t.string "address"
    t.integer "evaluation_point"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "introduction"
    t.integer "depacari_point"
  end

end
