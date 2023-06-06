class BasePropertySerializer
  include JSONAPI::Serializer

  set_type :property
  set_id :id
  attributes :street, :city, :state, :zip
end
