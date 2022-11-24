class ChangeRailwayStationsToStations < ActiveRecord::Migration[7.0]
  def up
    rename_table :railway_stations, :stations
  end

  def down
    rename_table :stations, :railway_stations
  end
end
