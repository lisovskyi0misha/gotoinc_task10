class AddOrderNumberToRoutesStations < ActiveRecord::Migration[7.0]
  def change
    add_column :routes_stations, :order_number, :integer
  end
end
