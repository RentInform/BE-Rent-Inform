class UserProperty < ApplicationRecord
  belongs_to :property

  def self.get_property_ids(user_id)
    where(user_id: user_id).pluck(:property_id)
  end
end
