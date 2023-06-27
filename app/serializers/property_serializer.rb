class PropertySerializer
  include JSONAPI::Serializer

  set_type :property
  set_id :id
  attributes :street,
             :city,
             :state,
             :zip,
             :walk_score,
             :bike_score,
             :transit_score,
             :safety_score,
             :lat,
             :lon,
             :parks
end
