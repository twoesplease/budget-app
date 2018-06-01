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

ActiveRecord::Schema.define(version: 20180601010310) do

  create_table "budgets", force: :cascade do |t|
    t.string "name"
    t.integer "goal_total"
    t.date "goal_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "remaining_amount"
    t.index ["name"], name: "index_budgets_on_name", unique: true
    t.index ["user_id"], name: "index_budgets_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.date "transaction_date"
    t.decimal "transaction_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "note"
    t.integer "budget_id"
    t.index ["budget_id"], name: "index_transactions_on_budget_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_digest"
    t.string "slug", default: "change this", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
