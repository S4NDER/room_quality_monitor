class CreateDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :devices do |t|
      t.string :device_name
      t.Temperture :temp
      t.Audio :audio
      t.Humidity :humidity
      t.Luminosity :luminosity

      t.timestamps
    end
  end
end
