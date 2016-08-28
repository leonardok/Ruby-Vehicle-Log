require './app/model/vehicle_type'

RSpec.describe VehicleType do
    it "is invalid when name is not present" do
        v = VehicleType.new
        expect(v.invalid?).to eq true
    end

    it "is valid when name is present" do
        v = VehicleType.new(:name => "taxi")
        expect(v.valid?).to eq true
    end
end
