class CreateVehicleType < ActiveRecord::Migration
  def change
    create_table :vehicle_types  do |t|
      t.string :name
    end
  end
end
