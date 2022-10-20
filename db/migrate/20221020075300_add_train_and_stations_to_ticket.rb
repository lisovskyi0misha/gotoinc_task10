class AddTrainAndStationsToTicket < ActiveRecord::Migration[7.0]
  def change
    add_reference :tickets, :train, foreign_key: true, null: false
    add_reference :tickets, :first_station, foreign_key: {to_table: :stations}, null: false
    add_reference :tickets, :last_station, foreign_key: {to_table: :stations}, null: false
  end
end
