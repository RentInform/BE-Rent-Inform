class Property < ApplicationRecord
  attr_accessor :walk_score,
                :bike_score,
                :transit_score,
                :safety_score,
                :city,
                :state,
                :lat,
                :lon,
                :parks

  has_many :user_properties
end
