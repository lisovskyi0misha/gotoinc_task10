class RoutesStation < ApplicationRecord
  belongs_to :route
  belongs_to :station
  scope :ordered, -> { order(:order_number) }
  validates_uniqueness_of :order_number, scope: :route_id
  enum status: [:first_station, :last_station]
end
