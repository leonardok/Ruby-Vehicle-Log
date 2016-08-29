require 'rack/test'
require './app/vehicle_controller'

RSpec.describe VehicleController do
  include Rack::Test::Methods

  def app
    VehicleController
  end

  context 'returns 400' do
    it 'when post parms are empty' do
      post '/log'
      expect(last_response.status).to eq(400)
    end

    it 'when received vehicle type differs from vehicle uuid type' do
      vehicle = create(:vehicle)
      
      post '/log', {:uuid => vehicle.id,
                    :type => vehicle.vehicle_type.id - 1,
                    :heading => 90,
                    :recorded_at => DateTime.now,
                    :lat => 30,
                    :lgt => 51}
      expect(last_response.status).to eq(400)
    end

    it 'when vehicle UUID is not in the database' do
      vehicle = build(:vehicle)
      
      post '/log', {:uuid => vehicle.id,
                    :type => vehicle.vehicle_type.id - 1,
                    :heading => 90,
                    :recorded_at => DateTime.now,
                    :lat => 30,
                    :lgt => 51}
      expect(last_response.status).to eq(400)
    end
  end

  it 'returns 200 but ignore when vehicle position outside the city' do
    # -29.3795583,-50.9365089 - Gramado
    # fixture is in Porto Alegre ~ 100km distance
    vehicle = create(:vehicle)
    
    post '/log', {:uuid => vehicle.id,
                  :type => vehicle.vehicle_type.id,
                  :heading => 90,
                  :recorded_at => DateTime.now,
                  :lat => -29.3795583,
                  :lgt => -50.9365089}
    expect(last_response.status).to eq(200)
  end

  it 'returns 200 for post with good formatting' do
    vehicle = create(:vehicle)
    
    post '/log', {:uuid => vehicle.id,
                  :type => vehicle.vehicle_type.id,
                  :heading => 90,
                  :recorded_at => DateTime.now,
                  :lat => 30,
                  :lgt => 51}
    expect(last_response.status).to eq(200)
  end
end
