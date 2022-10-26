class AddDepartureAndArrivalTimeToRoutesStations < ActiveRecord::Migration[7.0]
  def change
    add_column :routes_stations, :arrival_time, :timestamp
    add_column :routes_stations, :departure_time, :timestamp
  end
end
