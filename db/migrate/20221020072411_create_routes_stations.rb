class CreateRoutesStations < ActiveRecord::Migration[7.0]
  def change
    create_table :routes_stations do |t|

      t.timestamps
    end
  end
end
