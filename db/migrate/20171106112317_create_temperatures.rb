class CreateTemperatures < ActiveRecord::Migration[5.1]
  def change
    create_table :temperatures do |t|
      t.float :value

      t.integer :device_id, foreign_key: true

      t.timestamps
    end
  end
end
