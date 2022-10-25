class EconomyWagon < Wagon

  validates :lower_seats_quantity, :top_seats_quantity, :side_lower_seats_quantity, :side_top_seats_quantity, presence: true
end
