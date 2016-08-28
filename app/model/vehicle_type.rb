class VehicleType < ActiveRecord::Base
  has_many :vehicles

  validates :name, presence: true
end
