class CreateVehiclePositionLog < ActiveRecord::Migration
  def change
    create_table :vehicle_position_logs do |t|
      t.integer :heading
      t.datetime :recorded_at
      t.float :lat
      t.float :lgt

      t.uuid :vehicle_id
    end
  end
end
