class CreateTempertures < ActiveRecord::Migration[5.1]
  def change
    create_table :tempertures do |t|
      t.float :value

      t.timestamps
    end
  end
end
