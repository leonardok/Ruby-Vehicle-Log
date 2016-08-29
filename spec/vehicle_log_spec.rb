require './app/model/vehicle_position_log'

RSpec.describe VehiclePositionLog do
  context 'Should be invalid' do
    it "when the uuid is not present" do
      v = build(:vehicle_position_log)
      v.vehicle = nil

      expect(v.invalid?).to eq true
    end

    it "when the position is not present" do
      v = build(:vehicle_position_log)
      v.lat = nil
      v.lgt = nil

      expect(v.invalid?).to eq true
    end

    it "when lat is not valid" do
      v = build(:vehicle_position_log)

      v.lat = 91
      expect(v.invalid?).to eq true

      v.lat = -90.1
      expect(v.invalid?).to eq true
    end

    it "when lgt is not valid" do
      v = build(:vehicle_position_log)

      v.lgt = 190
      expect(v.invalid?).to eq true

      v.lgt = -180.1
      expect(v.invalid?).to eq true
    end

    it "when the timestamp is not present" do
      v = build(:vehicle_position_log)

      v.recorded_at = nil
      expect(v.invalid?).to eq true
    end

    it "when the current heading is not present" do
      v = build(:vehicle_position_log)

      v.heading = 360
      expect(v.invalid?).to eq true

      v.heading = -1
      expect(v.invalid?).to eq true
    end
  end

  context 'Should be valid' do
    it "it is valid when all the arguments are present" do
      v = build(:vehicle_position_log)
      expect(v.valid?).to eq true
    end
  end

  context 'Working with Geo' do
    it "is ignored when position is outside the city borders"
  end
end
