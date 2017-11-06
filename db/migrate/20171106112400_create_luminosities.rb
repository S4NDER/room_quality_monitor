class CreateLuminosities < ActiveRecord::Migration[5.1]
  def change
    create_table :luminosities do |t|
      t.float :value

      t.timestamps
    end
  end
end
