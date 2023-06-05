class UserPropertySerializer
  include JSONAPI::Serializer

  set_type :property
  set_id :id
  attributes :street, :city, :state
  attribute :zip, &:zipcode
end
