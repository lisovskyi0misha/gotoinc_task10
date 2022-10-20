class Route < ApplicationRecord
  validates :title, presence: true
  has_many :routes_stations
  has_many :stations, -> { distinct }, through: :routes_stations, dependent: :destroy
  has_many :trains
end