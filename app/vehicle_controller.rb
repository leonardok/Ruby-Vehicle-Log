require_relative 'application_controller'
require 'json'

require_relative 'model/vehicle'
require_relative 'model/vehicle_type'
require_relative 'model/vehicle_position_log'

# This class exposes the supported vehicle APIs
class VehicleController < ApplicationController
  # This logs a vehicle position
  #
  # params:
  #   vehicle_id      the vehicle uuid
  #   vehicle_type_id vehicle type
  #   lat              current latitude
  #   lgt              current longitude
  #   recorded_at      time when recorded position
  #   heading          Number between 0 and 359: 0 is true North. 180 is true
  #                    South. 90 is true East. 270 is true West
  #
  post '/log' do
    begin
      json = JSON.parse(request.body.read)
      position_log = VehiclePositionLog.new(json.slice("vehicle_id", "lat", "lgt", "recorded_at", "heading"))
    rescue
    end

    # if we couldnt create the position log return error
    if !position_log
      logger.info "Could not create position log with given values"
      halt 400
    end

    # check if its valid
    if position_log.invalid? or
       position_log.vehicle == nil or
       position_log.vehicle.vehicle_type == nil or
       position_log.vehicle.vehicle_type.id != json.fetch('vehicle_type_id').to_i
      logger.info position_log.errors
      halt 400
    end

    position_log.save
    {'message': 'ok'}.to_json
  end
end
