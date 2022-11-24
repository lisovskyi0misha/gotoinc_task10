class ChangeWagons < ActiveRecord::Migration[7.0]
  def change
    rename_column :wagons, :wagon_type, :type
    change_column :wagons, :type, :string
    add_column :wagons, :side_top_seats_quantity, :integer
    add_column :wagons, :side_lower_seats_quantity, :integer
    add_column :wagons, :sitted_seats_quantity, :integer
    add_column :wagons, :order_number, :integer
  end
end
