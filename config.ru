# require all the controllers
Dir.glob('./app/*_controller.rb').each { |file| require file }

map('/vehicles/') { run VehicleController }
map('/') { run HomeController }
