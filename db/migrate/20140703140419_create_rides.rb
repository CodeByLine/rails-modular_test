class CreateRides < ActiveRecord::Migration
  # Write your migrations here
  def change
    create_table :rides do |t|
      t.string   "name"
      t.string   "attraction_id"
      t.integer  "user_id"
      t.integer  "min_height"
      t.integer  "nausea_rating"
      t.integer  "happiness_rating"
      t.integer  "tickets"
    end
  end
end
