class CreateAudios < ActiveRecord::Migration[5.1]
  def change
    create_table :audios do |t|
      t.float :value

      t.timestamps
    end
  end
end
