require 'rails_helper'

RSpec.describe UserProperty, type: :model do
  describe 'relationships' do
    it { should belong_to(:property) }
  end
end
