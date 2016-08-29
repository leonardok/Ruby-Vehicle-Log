require_relative 'enabled_city'

class VehiclePositionLog < ActiveRecord::Base
  belongs_to :vehicle
  before_save :ignore_if_outside

  validates_presence_of :vehicle, :lat, :lgt, :recorded_at, :heading

  validates_numericality_of :lat, :greater_than_or_equal_to => -90, :less_than_or_equal_to => 90
  validates_numericality_of :lgt, :greater_than_or_equal_to => -180, :less_than_or_equal_to => 180
  validates_numericality_of :heading, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 359

  def recorded_at_valid_time
    errors.add(:recorded_at, 'must be a valid datetime') if (!recorded_at.is_a?(Time))
  end

  # This method will ignore the saving procedure if the point if outside the
  # designated city area. Currently this is hardcoded to 50000 meters (50km)
  def ignore_if_outside
    if distance_from_city_center > 50000
      return
    end
  end


  # make sure that we have the both pair of coordinates to calculate distance
  #
  def distance_from_city_center
    begin
      city = vehicle.enabled_city
    rescue
      return
    end

    loc1 = [city.center_lat, city.center_lgt] # loc1 is city center
    loc2 = [self.lat, self.lgt] # loc2 is the lat, lgt of the point

    if self.lat == nil or self.lat == 0 or self.lgt == nil or self.lgt == 0
      return
    end

    calculate_earth_distance loc1, loc2
  end

  # Calculates the distance between 2 points on earth
  #
  # This method gets two GPS coordinates in the world and calculates the distance
  # between the two point using the Haversine formula
  #
  def calculate_earth_distance loc1, loc2
    rad_per_deg = Math::PI/180  # PI / 180
    rkm = 6371                  # Earth radius in kilometers
    rm = rkm * 1000             # Radius in meters
  
    dlat_rad = (loc2[0]-loc1[0]) * rad_per_deg  # Delta, converted to rad
    dlon_rad = (loc2[1]-loc1[1]) * rad_per_deg
  
    lat1_rad, lon1_rad = loc1.map {|i| i * rad_per_deg }
    lat2_rad, lon2_rad = loc2.map {|i| i * rad_per_deg }
  
    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))
  
    rm * c # Delta in meters
  end
end
