class AddStatusToRoutesStations < ActiveRecord::Migration[7.0]
  def change
    add_column :routes_stations, :status, :integer
  end
end
