class AddStationToTrain < ActiveRecord::Migration[7.0]
  def change
    add_reference :trains, :current_station, foreign_key: {to_table: :stations}
  end
end
