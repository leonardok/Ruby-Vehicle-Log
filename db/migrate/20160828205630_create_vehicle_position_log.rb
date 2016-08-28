class CreateVehiclePositionLog < ActiveRecord::Migration
  def change
    create_table :vehicle_position_logs, id: :uuid  do |t|
      t.integer :heading
      t.datetime :recorded_at
      t.float :lat
      t.float :lgt

      t.belongs_to :vehicle
    end
  end
end
