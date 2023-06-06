class PropertySerializer
  include JSONAPI::Serializer

  set_type :property
  set_id :id
  attributes :street, :city, :state, :walk_score, :bike_score, :transit_score, :safety_score
  attribute :zip, &:zipcode
end
