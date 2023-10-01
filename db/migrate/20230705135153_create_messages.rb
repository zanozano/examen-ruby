class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :nombre
      t.string :email
      t.text :mensaje
      t.timestamps
    end
  end
end
