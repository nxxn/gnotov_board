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

ActiveRecord::Schema.define(version: 20161026184822) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ad_comfort_options", force: :cascade do |t|
    t.integer "ad_id"
    t.boolean "headup_display",      default: false
    t.boolean "rain_sensor",         default: false
    t.boolean "self_steering",       default: false
    t.boolean "webasto",             default: false
    t.boolean "keyless_entry",       default: false
    t.boolean "softclose",           default: false
    t.boolean "electric_windows",    default: false
    t.boolean "electric_mirrors",    default: false
    t.boolean "electric_trunk",      default: false
    t.boolean "anti_dazzle_mirrors", default: false
    t.boolean "air_suspension",      default: false
    t.boolean "air_conditioning",    default: false
    t.boolean "auto_climate",        default: false
    t.boolean "sunroof",             default: false
    t.boolean "panoramic_roof",      default: false
    t.boolean "isofix",              default: false
    t.boolean "second_wheels",       default: false
    t.boolean "tow_bar",             default: false
  end

  create_table "ad_driving_options", force: :cascade do |t|
    t.integer "ad_id"
    t.boolean "four_wheel_drive",        default: false
    t.boolean "cruise_control",          default: false
    t.boolean "adaptive_cruise_control", default: false
    t.boolean "spare_wheel",             default: false
    t.boolean "tire_pressure",           default: false
    t.boolean "start_stop",              default: false
  end

  create_table "ad_issues", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "ad_id"
    t.string   "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ad_lights_options", force: :cascade do |t|
    t.integer "ad_id"
    t.boolean "xenon_lights",    default: false
    t.boolean "bixenon_lights",  default: false
    t.boolean "led_lights",      default: false
    t.boolean "laser_lights",    default: false
    t.boolean "adaptive_lights", default: false
    t.boolean "fog_lights",      default: false
    t.boolean "daytime_lights",  default: false
  end

  create_table "ad_multimedia_options", force: :cascade do |t|
    t.integer "ad_id"
    t.boolean "navigation",          default: false
    t.boolean "aux",                 default: false
    t.boolean "usb",                 default: false
    t.boolean "bluetooth",           default: false
    t.boolean "roof_rack",           default: false
    t.boolean "tv",                  default: false
    t.boolean "media_for_backseats", default: false
  end

  create_table "ad_photos", force: :cascade do |t|
    t.integer  "ad_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "token",              default: ""
  end

  create_table "ad_safety_options", force: :cascade do |t|
    t.integer "ad_id"
    t.boolean "lane_warning",        default: false
    t.boolean "sign_recognition",    default: false
    t.boolean "traction_control",    default: false
    t.boolean "parktronic_back",     default: false
    t.boolean "parktronic_front",    default: false
    t.boolean "blind_spot_monitor",  default: false
    t.boolean "collision_avoidance", default: false
    t.boolean "backup_camera",       default: false
    t.boolean "surround_camera",     default: false
    t.boolean "auto_parking",        default: false
    t.boolean "night_vision",        default: false
  end

  create_table "ad_seats_options", force: :cascade do |t|
    t.integer "ad_id"
    t.boolean "heated_seats",          default: false
    t.boolean "back_heated_seats",     default: false
    t.boolean "ventilated_seats",      default: false
    t.boolean "back_ventilated_seats", default: false
    t.boolean "massage_seats",         default: false
    t.boolean "back_massage_seats",    default: false
    t.boolean "memory_seats",          default: false
    t.boolean "electric_seats",        default: false
    t.boolean "sport_seats",           default: false
    t.boolean "seven_seats",           default: false
    t.string  "seats_material",        default: ""
  end

  create_table "ad_steering_options", force: :cascade do |t|
    t.integer "ad_id"
    t.boolean "heated_st_wheel",    default: false
    t.boolean "electric_st_wheel",  default: false
    t.boolean "regulated_st_wheel", default: false
    t.boolean "multi_st_wheel",     default: false
    t.boolean "memory_st_wheel",    default: false
    t.boolean "wood_st_wheel",      default: false
  end

  create_table "ad_tech_specs", force: :cascade do |t|
    t.integer "ad_id"
    t.integer "mileage"
    t.integer "built_year"
    t.integer "built_month"
    t.integer "inspection_year"
    t.integer "inspection_month"
    t.integer "power"
    t.float   "engine_cc"
    t.boolean "new_car"
    t.string  "vin_number"
    t.string  "color"
    t.string  "body_type"
    t.string  "engine_type"
    t.string  "gearbox",          default: ""
  end

  create_table "ads", force: :cascade do |t|
    t.string   "title"
    t.string   "phone"
    t.string   "phone_additional"
    t.string   "email"
    t.string   "website"
    t.text     "description"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "user_id"
    t.integer  "car_make_id"
    t.integer  "car_model_id"
    t.boolean  "active",           default: false
    t.boolean  "paid",             default: false
    t.string   "country",          default: ""
    t.string   "city",             default: ""
    t.float    "price",            default: 0.0
  end

  create_table "car_makes", force: :cascade do |t|
    t.string "name"
  end

  create_table "car_models", force: :cascade do |t|
    t.integer "car_make_id"
    t.string  "name"
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name",       default: ""
    t.boolean  "main",       default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "favorite_ads", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "ad_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "email",      default: ""
    t.string   "phone",      default: ""
    t.text     "question",   default: ""
    t.string   "status",     default: "Asked"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "email",                    default: "",    null: false
    t.string   "encrypted_password",       default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.boolean  "dealer",                   default: false
    t.string   "dealer_name",              default: ""
    t.string   "dealer_address",           default: ""
    t.string   "dealer_phone",             default: ""
    t.text     "dealer_description",       default: ""
    t.string   "dealer_logo_file_name"
    t.string   "dealer_logo_content_type"
    t.integer  "dealer_logo_file_size"
    t.datetime "dealer_logo_updated_at"
    t.boolean  "active",                   default: true
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "ad_photos", "ads"
end
