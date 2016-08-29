class VehicleType < ActiveRecord::Base
  has_many :vehicles

  validates_presence_of :name
end
