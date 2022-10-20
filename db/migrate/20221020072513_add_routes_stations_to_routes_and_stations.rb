class AddRoutesStationsToRoutesAndStations < ActiveRecord::Migration[7.0]
  def change
    add_reference :routes_stations, :routes, foreign_key: true, null: false
    add_reference :routes_stations, :stations, foreign_key: true, null: false
  end
end
