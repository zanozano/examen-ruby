class AddMantainerToEquipment < ActiveRecord::Migration[7.0]
  def change
    add_reference :equipment, :mantainer, null: false, foreign_key: true
  end
end
