class CreateTablePlants < ActiveRecord::Migration[5.1]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :scientific_name
      t.string :plant_type
      t.string :general
      t.string :ecology
      t.string :cones
      t.string :leaves
      t.string :branches
      t.string :bark

      t.timestamps
    end
  end
end
