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

ActiveRecord::Schema[8.1].define(version: 2025_11_30_194644) do
  create_table "games", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.integer "round", default: 0
    t.datetime "updated_at", null: false
  end

  create_table "participations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "game_id"
    t.integer "player_id"
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "rounds", force: :cascade do |t|
    t.integer "bonus", default: 0
    t.datetime "created_at", null: false
    t.integer "guess"
    t.integer "number"
    t.integer "participation_id", null: false
    t.integer "result"
    t.datetime "updated_at", null: false
    t.index ["participation_id"], name: "index_rounds_on_participation_id"
  end

  add_foreign_key "rounds", "participations"
end
