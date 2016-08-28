class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles, id: :uuid  do |t|
      t.belongs_to :enabled_city
      t.belongs_to :vehicle_type
    end
  end
end
