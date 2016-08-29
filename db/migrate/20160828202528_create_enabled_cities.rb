class CreateEnabledCities < ActiveRecord::Migration
  def change
    create_table :enabled_cities  do |t|
      t.string :name
      t.integer :radius
      t.float :center_lat
      t.float :center_lgt
    end
  end
end
