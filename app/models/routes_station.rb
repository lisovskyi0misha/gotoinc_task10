class RoutesStation < ApplicationRecord
  belongs_to :route
  belongs_to :station

  scope :ordered, -> { order(:order_number) }
end