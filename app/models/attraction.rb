class Attraction < ActiveRecord::Base
  # write associations here
  has_many :rides
  has_many :users, through: :rides
end

# attraction is valid with a name, min_height, nausea_rating, happiness_rating, and ticket number
# rspec ./spec/models/attraction_spec.rb:18 # Attraction has many rides
# rspec ./spec/models/attraction_spec.rb:24 # Attraction has many users through rides
