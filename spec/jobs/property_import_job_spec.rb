require 'rails_helper'

RSpec.describe PropertyImportJob, type: :job do
  describe 'perform' do
    before(:all) do
      @file_path = Rails.root.join('spec', 'fixtures', 'TEST_DATA.csv').to_s
      PropertyImportJob.perform_now(@file_path)
    end

    after(:all) do
      Property.destroy_all
    end

    it 'creates and saves property records for each unique address in a CSV file' do
      expect(Property.count).to eq(9)

      Property.all.each do |property|
        expect(property).to be_a(Property)

        expect(property.street).to be_a(String) unless property.street.nil?
        expect(property.zip).to be_a(String) unless property.zip.nil?
        expect(property.license_number).to be_a(String) unless property.license_number.nil?
      end

      expect(Property.first.street).to eq('1 ACADEMY CIR # 319')
      expect(Property.first.zip).to eq('19146')
      expect(Property.first.license_number).to eq('835117')
    end

    it 'destroys all temporary properties after job is completed' do
      expect(TempProperty.count).to eq(0)
    end

    it 'does not create duplicate records for any existing address when run more than once' do
      initial_count = Property.count

      PropertyImportJob.perform_now(@file_path)
      expect(Property.count).to eq(initial_count)
    end
  end
end
