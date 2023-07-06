class ChangeMantainerIdNullableInEquipment < ActiveRecord::Migration[7.0]
  def change
    change_column :equipment, :mantainer_id, :bigint, null: true
  end
end
