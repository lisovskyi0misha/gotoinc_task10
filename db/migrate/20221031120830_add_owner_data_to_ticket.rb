class AddOwnerDataToTicket < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :owner_name, :string
    add_column :tickets, :owner_passport, :string
  end
end
