require_relative 'application_controller'
require 'json'
require 'pry'

# This class exposes the supported vehicle APIs
class VehicleController < ApplicationController
  # This logs a vehicle position
  #
  # params:
  #   uuid        the vehicle uuid
  #   type        vehicle type
  #   lat         current latitude
  #   lgt         current longitude
  #   recorded_at time when recorded position
  #   heading     Number between 0 and 359: 0 is true North. 180 is true
  #               South. 90 is true East. 270 is true West
  #
  post '/log' do
    vehicle = Vehicle.find_by id: request.params.fetch('uuid', 0)

    position_log = VehiclePositionLog.new
    position_log.vehicle_id = vehicle.id if vehicle != nil
    position_log.lat = request.params.fetch('lat', 190)
    position_log.lgt = request.params.fetch('lgt', 190)
    position_log.heading = request.params.fetch('heading', 361)

    begin
      position_log.recorded_at = DateTime.parse(request.params.fetch('recorded_at'))
    rescue
      position_log.recorded_at = 0
    end

    if position_log.invalid? or
       vehicle.vehicle_type.id.to_s != request.params.fetch('type')
      halt 400
    end

    position_log.save
    {'message': 'ok'}.to_json
  end
end
