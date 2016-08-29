require 'spec_helper'
require './app/model/vehicle'
require './app/model/vehicle_type'
require './app/model/enabled_city'

describe Vehicle do
  context 'Should not be valid' do
    it "when type is not present" do
      city = create(:enabled_city)

      v = Vehicle.new(:enabled_city => city)
      expect(v.invalid?).to eq true
    end

    it "when is has no city" do
      type = create(:vehicle_type)

      v = Vehicle.new(:vehicle_type => type)
      expect(v.invalid?).to eq true
    end

    it 'when the uuid is not valid' do
      v = Vehicle.new
      is_valid = v.validates_uuid_format 'not valid uuid'
      expect(is_valid).to eq false
    end
  end

  context 'Should be valid' do
    it "when name, city and type are present, and type is on the database" do
      city = create(:enabled_city)
      type = create(:vehicle_type)

      v = Vehicle.new(:vehicle_type => type, :enabled_city => city)
      expect(v.valid?).to eq true
    end
  end

  it 'Should save the ID in the UUID format' do
    v = create(:vehicle)
    expect(v.validates_uuid_format(v.id)).to eq true
  end
end
