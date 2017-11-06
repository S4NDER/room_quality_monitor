class CreateDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :devices do |t|
      t.references :audio, foreign_key: true
      t.references :humidity, foreign_key: true
      t.references :luminosity, foreign_key: true
      t.references :temperature, foreign_key: true

      t.timestamps
    end
  end
end
