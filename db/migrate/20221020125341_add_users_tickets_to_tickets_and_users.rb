class AddUsersTicketsToTicketsAndUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users_tickets, :user, foreign_key: true, null: false
    add_reference :users_tickets, :ticket, foreign_key: true, null: false
  end
end
