class CreateVehicleType < ActiveRecord::Migration
  def change
    create_table :vehicle_types, id: :uuid  do |t|
      t.string :name
    end
  end
end
