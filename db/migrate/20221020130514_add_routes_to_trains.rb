class AddRoutesToTrains < ActiveRecord::Migration[7.0]
  def change
    add_reference :trains, :route, foreign_key: true
  end
end
