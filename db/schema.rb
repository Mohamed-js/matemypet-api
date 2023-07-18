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

ActiveRecord::Schema[7.0].define(version: 2023_07_17_054643) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "btree_gin"
  enable_extension "btree_gist"
  enable_extension "citext"
  enable_extension "cube"
  enable_extension "dblink"
  enable_extension "dict_int"
  enable_extension "dict_xsyn"
  enable_extension "earthdistance"
  enable_extension "fuzzystrmatch"
  enable_extension "hstore"
  enable_extension "intarray"
  enable_extension "ltree"
  enable_extension "pg_stat_statements"
  enable_extension "pg_trgm"
  enable_extension "pgcrypto"
  enable_extension "pgrowlocks"
  enable_extension "pgstattuple"
  enable_extension "plpgsql"
  enable_extension "plv8"
  enable_extension "tablefunc"
  enable_extension "unaccent"
  enable_extension "uuid-ossp"
  enable_extension "xml2"

  create_table "ad_views", force: :cascade do |t|
    t.boolean "is_liked"
    t.string "longitude"
    t.string "latitude"
    t.string "country"
    t.string "city"
    t.integer "ad_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admins", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "name"
    t.boolean "is_super"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ads", force: :cascade do |t|
    t.string "owner"
    t.integer "priority"
    t.string "link_to_ad"
    t.integer "views"
    t.string "app_appearance_place"
    t.text "image"
    t.string "caption"
    t.integer "duration_in_days"
    t.boolean "is_expired"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "animals", force: :cascade do |t|
    t.integer "user_id"
    t.integer "breed_id"
    t.string "name"
    t.string "gender"
    t.text "bio"
    t.datetime "dob"
    t.boolean "vaccinated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "longitude"
    t.decimal "latitude"
  end

  create_table "avatars", force: :cascade do |t|
    t.integer "animal_id"
    t.text "url"
    t.string "caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "breeds", force: :cascade do |t|
    t.string "name"
    t.integer "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chats", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.integer "blocker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "last_updated"
  end

  create_table "dislikes", force: :cascade do |t|
    t.integer "disliker_animal_id"
    t.integer "disliker_user_id"
    t.integer "disliked_animal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "liker_animal_id"
    t.integer "liker_user_id"
    t.integer "liked_animal_id"
    t.integer "liked_user_id"
    t.boolean "is_liked_back"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer "chat_id"
    t.integer "sender_id"
    t.integer "receiver_id"
    t.text "body"
    t.boolean "seen"
    t.boolean "is_multimedia"
    t.boolean "is_video"
    t.text "tumbnail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "paymob_transactions", force: :cascade do |t|
    t.text "data"
    t.integer "t_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "tier_id"
    t.boolean "has_unlimited_likes"
    t.integer "likes"
    t.integer "max_file_size"
    t.integer "pets"
    t.boolean "ads"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "likes_default"
    t.datetime "first_like_date"
    t.boolean "likes_updated"
  end

  create_table "tiers", force: :cascade do |t|
    t.string "name"
    t.integer "likes"
    t.integer "max_file_size"
    t.integer "pets"
    t.boolean "ads"
    t.boolean "has_unlimited_likes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "written_features"
    t.decimal "price"
  end

  create_table "transactions", force: :cascade do |t|
    t.text "body"
    t.integer "user_id"
    t.integer "tier_id"
    t.decimal "value"
    t.integer "service_transaction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_notifications", force: :cascade do |t|
    t.integer "user_id"
    t.string "body"
    t.text "image"
    t.string "title"
    t.string "redirect_to"
    t.integer "redirect_to_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_reports", force: :cascade do |t|
    t.integer "user_id"
    t.integer "reported_id"
    t.string "reported_type"
    t.text "body"
    t.text "image"
    t.boolean "read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "email"
    t.datetime "email_verified_at"
    t.string "password"
    t.string "token"
    t.string "otp_code"
    t.string "avatar"
    t.boolean "verified"
    t.boolean "blocked"
    t.string "bio"
    t.string "country"
    t.string "city"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.decimal "longitude"
    t.decimal "latitude"
  end

end
