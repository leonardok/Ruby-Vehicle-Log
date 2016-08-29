class VehiclePositionLog < ActiveRecord::Base
  belongs_to :vehicle

  validates_presence_of :vehicle, :lat, :lgt, :recorded_at, :heading
  validate :recorded_at_valid_datetime

  validates_numericality_of :lat, :greater_than_or_equal_to => -90, :less_than_or_equal_to => 90
  validates_numericality_of :lgt, :greater_than_or_equal_to => -180, :less_than_or_equal_to => 180
  validates_numericality_of :heading, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 359

  def recorded_at_valid_datetime
    errors.add(:happened_at, 'must be a valid datetime') if (!recorded_at.is_a?(DateTime))
  end
end
