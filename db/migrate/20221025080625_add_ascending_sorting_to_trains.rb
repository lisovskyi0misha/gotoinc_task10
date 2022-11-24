class AddAscendingSortingToTrains < ActiveRecord::Migration[7.0]
  def change
    add_column :trains, :ascending_sorting, :boolean, default: true
  end
end
