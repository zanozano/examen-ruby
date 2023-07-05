class CreateMantainers < ActiveRecord::Migration[7.0]
  def change
    create_table :mantainers do |t|
      t.string :type_equipment
      t.string :type_support
      t.string :name
      t.string :city
      t.string :material

      t.timestamps
    end
  end
end
