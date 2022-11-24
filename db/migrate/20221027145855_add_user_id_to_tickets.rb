class AddUserIdToTickets < ActiveRecord::Migration[7.0]
  def change
    add_reference :tickets, :user, foreign_key: true, null: false
  end
end
