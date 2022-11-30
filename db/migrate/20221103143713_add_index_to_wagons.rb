class AddIndexToWagons < ActiveRecord::Migration[7.0]
  def change
    add_index :wagons, [:id, :type]
  end
end
