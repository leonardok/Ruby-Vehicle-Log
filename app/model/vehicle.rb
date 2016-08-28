class Vehicle < ActiveRecord::Base
  belongs_to :enabled_city
  belongs_to :vehicle_type
  has_many :vehicle_position_logs

  validates_presence_of :vehicle_type
  validates_presence_of :enabled_city
end
