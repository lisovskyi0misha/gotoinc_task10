class CreateWagons < ActiveRecord::Migration[7.0]
  def change
    create_table :wagons do |t|
      t.integer :wagon_type
      t.integer :top_seats_quantity
      t.integer :lower_seats_quantity
      t.timestamps
    end
    add_reference :wagons, :train, foreign_key: true, null: false
  end
end
