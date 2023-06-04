class Property < ApplicationRecord
  attr_accessor :walk_score, :bike_score, :transit_score, :safety_score, :city, :state
end