class Train < ApplicationRecord
  has_one :route
  has_many :tickets
  belongs_to :route
  belongs_to :current_station, class_name: 'Station'
end
