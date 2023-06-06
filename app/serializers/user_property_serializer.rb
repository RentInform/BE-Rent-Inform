class UserPropertySerializer
  include JSONAPI::Serializer
  
  set_type :user_property
  set_id :id
  attributes :user_id, :property_id
end