class CreateAdminpages < ActiveRecord::Migration[5.1]
  def change
    create_table :adminpages do |t|

      t.timestamps
    end
  end
end
