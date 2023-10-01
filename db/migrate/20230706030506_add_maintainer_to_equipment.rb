class AddMaintainerToEquipment < ActiveRecord::Migration[7.0]
  def change
    add_reference :equipment, :maintainer, null: false, foreign_key: true
  end
end
