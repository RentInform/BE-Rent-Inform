class UserPropertyFacade
  def get_properties(user_id)
    property_ids = get_property_ids(user_id)
    find_properties(property_ids)
  end

  def get_property(user_id, property_id)
   property = find_properties([property_id]).first
   set_city_and_state_one_property(property)
   property
  end
  private

  def get_property_ids(user_id)
    UserProperty.where(user_id: user_id).pluck(:property_id)
  end

  def find_properties(property_ids)
    properties = Property.where(id: property_ids)
    set_city_and_state(properties)
  end

  def set_city_and_state_one_property(property)
    property.city = 'Philadelphia'
    property.state = 'PA'
    property
  end

  def set_city_and_state(properties)
    properties.map do |property|
      property.city = 'Philadelphia'
      property.state = 'PA'
      property
    end
  end
end
