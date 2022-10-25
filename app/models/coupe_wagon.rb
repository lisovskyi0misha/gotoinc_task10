class CoupeWagon < Wagon

  validates :lower_seats_quantity, :top_seats_quantity, presence: true
end
