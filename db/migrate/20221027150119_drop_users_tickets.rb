class DropUsersTickets < ActiveRecord::Migration[7.0]
  def up
    drop_table :users_tickets
  end

  def down
    create_table :users_tickets do |t|
      t.timestamps
    end
  end
end
