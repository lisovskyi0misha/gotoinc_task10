class Train < ApplicationRecord
  has_one :route
  has_many :tickets
  belongs_to :route
  belongs_to :current_station, class_name: 'Station'
  has_many :wagons

  def count_seats(type, seat_type)
    count = 0
    self.wagons.method(type.to_sym).call.each do |wagon|
      count += wagon.method("#{seat_type}_quantity".to_sym).call
    end
    count
  end
end
