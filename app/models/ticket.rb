class Ticket < ApplicationRecord
  belongs_to :first_station, class_name: 'Station'
  belongs_to :last_station, class_name: 'Station'
  belongs_to :train
  has_many :users_tickets
  has_many :users, through: :users_tickets
end