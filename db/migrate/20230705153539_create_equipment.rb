class CreateEquipment < ActiveRecord::Migration[7.0]
  def change
    create_table :equipment do |t|
      t.string :equipment_type
      t.string :name
      t.text :description
      t.string :photo
      t.timestamps
    end
  end
end
