class Ticket < ApplicationRecord
  belongs_to :first_station, class_name: 'Station'
  belongs_to :last_station, class_name: 'Station'
  belongs_to :train
  belongs_to :user
end
