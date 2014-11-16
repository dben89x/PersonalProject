ActiveRecord::Schema.define(version: 20141107222529) do

  enable_extension "plpgsql"

  create_table "spots", force: true do |t|
    t.string "location"
    t.string "others"
    t.string "description"
    t.time   "time"
  end

  create_table "users", force: true do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
  end

end
