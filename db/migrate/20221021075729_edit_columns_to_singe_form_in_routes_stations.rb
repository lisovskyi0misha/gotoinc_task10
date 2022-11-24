class EditColumnsToSingeFormInRoutesStations < ActiveRecord::Migration[7.0]
  def change
    rename_column :routes_stations, :routes_id, :route_id
    rename_column :routes_stations, :stations_id, :station_id
  end
end
