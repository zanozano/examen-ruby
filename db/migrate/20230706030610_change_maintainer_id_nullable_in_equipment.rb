class ChangeMaintainerIdNullableInEquipment < ActiveRecord::Migration[7.0]
  def change
    change_column :equipment, :maintainer_id, :bigint, null: true
  end
end
