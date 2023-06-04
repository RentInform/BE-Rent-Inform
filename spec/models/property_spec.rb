require 'rails_helper'

RSpec.describe Property, type: :model do
  describe 'relationships' do
    it { should have_many(:user_properties) }
  end

  describe 'attributes' do
    subject { Property.new }

    it "should have the attributes city, state, and the four scores" do
      attributes = %i[city state walk_score bike_score transit_score safety_score]
      attributes.each do |attribute|
        expect(subject).to respond_to(attribute)
      end
    end

    it "should set and get attributes correctly" do
      expect(subject.city).to eq(nil)
      expect(subject.state).to eq(nil)
      expect(subject.walk_score).to eq(nil)
      expect(subject.bike_score).to eq(nil)
      expect(subject.transit_score).to eq(nil)
      expect(subject.safety_score).to eq(nil)

      subject.city = "Philadelphia"
      subject.state = "PA"
      subject.walk_score = "100"
      subject.bike_score = "97"
      subject.transit_score = "1"
      subject.safety_score = "28"

      expect(subject.city).to eq("Philadelphia")
      expect(subject.state).to eq("PA")
      expect(subject.walk_score).to eq("100")
      expect(subject.bike_score).to eq("97")
      expect(subject.transit_score).to eq("1")
      expect(subject.safety_score).to eq("28")
    end
  end
end
