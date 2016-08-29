class Vehicle < ActiveRecord::Base
  belongs_to :enabled_city
  belongs_to :vehicle_type
  has_many :vehicle_position_logs

  validates_presence_of :vehicle_type
  validates_presence_of :enabled_city

  def validates_uuid_format(id)
    return false if /^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$/.match(id) == nil
    true
  end
end
