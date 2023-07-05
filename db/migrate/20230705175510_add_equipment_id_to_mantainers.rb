class AddEquipmentIdToMantainers < ActiveRecord::Migration[7.0]
  def change
    add_reference :mantainers, :equipment, null: false, foreign_key: true
  end
end
