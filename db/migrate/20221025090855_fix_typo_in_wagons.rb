class FixTypoInWagons < ActiveRecord::Migration[7.0]
  def change
    rename_column :wagons, :sitted_seats_quantity, :seated_seats_quantity
  end
end
