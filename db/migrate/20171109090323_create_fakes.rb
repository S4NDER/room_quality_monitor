class CreateFakes < ActiveRecord::Migration[5.1]
  def change
    create_table :fakes do |t|

      t.timestamps
    end
  end
end
