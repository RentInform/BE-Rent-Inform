class PropertySerializer
  include JSONAPI::Serializer

  set_type :property
  set_id :id
  attributes :street, :walk_score, :bike_score, :transit_score, :safety_score
  attribute :zip, &:zipcode

  attribute :city do |object|
    object.city = "Philadelphia"
  end

  attribute :state do |object|
    object.state = "PA"
  end
end
