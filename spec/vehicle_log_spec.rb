require './app/model/vehicle_position_log'

RSpec.describe VehiclePositionLog do
    it "is invalid when the uuid is not present" do
      vehicle = create(:vehicle)
    end

    it "is invalid when the vehicle type is not present"
    it "is invalid when the position is not present"
    it "is invalid when the position is not valid"
    it "is invalid when the timestamp is not present"
    it "is invalid when the current heading is not present"
    it "it is valid when all the arguments are present"

    it "is ignored when position is outside the city borders"
end
