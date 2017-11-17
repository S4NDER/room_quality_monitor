class CreateChartByDeviceTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :chart_by_device_types do |t|

      t.timestamps
    end
  end
end
