class RemoveNameAndPassportCodeFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :name
    remove_column :users, :passport_code
  end
end
