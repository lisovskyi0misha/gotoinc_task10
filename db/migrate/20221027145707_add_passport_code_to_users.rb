class AddPassportCodeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :passport_code, :string
  end
end
