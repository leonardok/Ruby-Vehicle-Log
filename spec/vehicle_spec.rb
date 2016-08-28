require 'spec_helper'
require './app/model/vehicle'
require './app/model/vehicle_type'
require './app/model/enabled_city'

describe Vehicle do
    it "is invalid when type is not present" do
      city = create(:enabled_city)

      v = Vehicle.new(:enabled_city => city)
      expect(v.invalid?).to eq true
    end

    it "is invalid when is has no city" do
      type = create(:vehicle_type)

      v = Vehicle.new(:vehicle_type => type)
      expect(v.invalid?).to eq true
    end

    it "is valid when name, city and type are present, and type is on the database" do
      city = create(:enabled_city)
      type = create(:vehicle_type)

      v = Vehicle.new(:vehicle_type => type, :enabled_city => city)
      expect(v.valid?).to eq true
    end
end