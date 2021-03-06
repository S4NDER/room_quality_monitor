class CreateDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :devices do |t|
      t.references :audio
      t.references :humidity
      t.references :luminosity
      t.references :temperature 
      t.references :barometer
      t.string :device_name
    
      t.timestamps
    end
  end
end
