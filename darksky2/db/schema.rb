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

ActiveRecord::Schema.define(version: 20180214215513) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conditions", force: :cascade do |t|
    t.float "niseko_today"
    t.float "niseko_tomorrow"
    t.float "niseko_three_day"
    t.float "niseko_seven_day"
    t.float "rusutsu_today"
    t.float "rusutsu_tomorrow"
    t.float "rusutsu_three_day"
    t.float "rusutsu_seven_day"
    t.float "furano_today"
    t.float "furano_tomorrow"
    t.float "furano_three_day"
    t.float "furano_seven_day"
    t.float "kiroro_today"
    t.float "kiroro_tomorrow"
    t.float "kiroro_three_day"
    t.float "kiroro_seven_day"
    t.float "hakuba_today"
    t.float "hakuba_tomorrow"
    t.float "hakuba_three_day"
    t.float "hakuba_seven_day"
    t.float "nozawa_onsen_today"
    t.float "nozawa_onsen_tomorrow"
    t.float "nozawa_onsen_three_day"
    t.float "nozawa_onsen_seven_day"
    t.float "shiga_kogen_today"
    t.float "shiga_kogen_tomorrow"
    t.float "shiga_kogen_three_day"
    t.float "shiga_kogen_seven_day"
    t.float "myoko_kogen_today"
    t.float "myoko_kogen_tomorrow"
    t.float "myoko_kogen_three_day"
    t.float "myoko_kogen_seven_day"
    t.float "yongpyong_today"
    t.float "yongpyong_tomorrow"
    t.float "yongpyong_three_day"
    t.float "yongpyong_seven_day"
    t.float "alpensia_today"
    t.float "alpensia_tomorrow"
    t.float "alpensia_three_day"
    t.float "alpensia_seven_day"
    t.float "phoenix_snow_park_today"
    t.float "phoenix_snow_park_tomorrow"
    t.float "phoenix_snow_park_three_day"
    t.float "phoenix_snow_park_seven_day"
    t.float "high1_resort_today"
    t.float "high1_resort_tomorrow"
    t.float "high1_resort_three_day"
    t.float "high1_resort_seven_day"
    t.float "vivaldi_park_today"
    t.float "vivaldi_park_tomorrow"
    t.float "vivaldi_park_three_day"
    t.float "vivaldi_park_seven_day"
    t.float "yabuli_today"
    t.float "yabuli_tomorrow"
    t.float "yabuli_three_day"
    t.float "yabuli_seven_day"
    t.float "beidahu_today"
    t.float "beidahu_tomorrow"
    t.float "beidahu_three_day"
    t.float "beidahu_seven_day"
    t.float "changbaishan_today"
    t.float "changbaishan_tomorrow"
    t.float "changbaishan_three_day"
    t.float "changbaishan_seven_day"
    t.float "chongli_today"
    t.float "chongli_tomorrow"
    t.float "chongli_three_day"
    t.float "chongli_seven_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
