# require all the controllers
require_relative 'app/vehicle_controller.rb'
require_relative 'app/home_controller.rb'

map('/vehicles/') { run VehicleController }
map('/') { run HomeController }
