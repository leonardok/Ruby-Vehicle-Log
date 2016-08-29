# Rakefile
# bundle exec rake -T

require 'sinatra/activerecord/rake'
require 'zlib'

require_relative 'config/environments'

namespace :db do
  task :load_config do
    require_relative "app/application_controller"
  end
end
