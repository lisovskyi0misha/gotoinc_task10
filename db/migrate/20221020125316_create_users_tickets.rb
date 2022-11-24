class CreateUsersTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :users_tickets do |t|
      t.timestamps
    end
  end
end
