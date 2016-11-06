class CreateUsers < ActiveRecord::Migration
  # Write your migrations here
  def change

    create_table "users" do |t|
      t.string   "name"
      t.string   "password_digest"
      t.integer  "height"
      t.integer  "nausea"
      t.integer  "happiness"
      t.integer  "tickets"
      t.boolean  "admin",            default: false
      t.datetime "created_at",                  null: false
      t.datetime "updated_at",                  null: false
    end

  end
end
