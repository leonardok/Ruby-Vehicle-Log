require 'sinatra/base'
require 'json'

# This class exposes the supported vehicle APIs
class VehicleController < Sinatra::Base
    # This logs a vehicle position
    #
    # params:
    #   uuid        the vehicle uuid
    #   type        vehicle type
    #   lat         current latitude
    #   lgt         current longitude
    #   timestamp   time when recorded position
    #   heading     Number between 0 and 359: 0 is true North. 180 is true
    #               South. 90 is true East. 270 is true West
    #
    post '/log' do
        {'message': 'ok'}.to_json
    end
end
