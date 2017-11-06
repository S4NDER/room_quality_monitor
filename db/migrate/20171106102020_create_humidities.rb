class CreateHumidities < ActiveRecord::Migration[5.1]
  def change
    create_table :humidities do |t|
      t.float :value

      t.timestamps
    end
  end
end
