class Ticket < ApplicationRecord
  belongs_to :first_station, class_name: 'Station'
  belongs_to :last_station, class_name: 'Station'
  belongs_to :train
  belongs_to :user
  validates_format_of :owner_passport, with: /\A\d{9}\z/, message: 'Must contain 9 digits'
  validates :owner_name, presence: true
end
