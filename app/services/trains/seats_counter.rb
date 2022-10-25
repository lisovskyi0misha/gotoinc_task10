module Trains
  class SeatsCounter
    
    def initialize(wagons)
      @wagons = wagons
    end

    def count
      @seats = {top: 0, lower: 0, side_top: 0, side_lower: 0, seated: 0}
      @wagons.each do |wagon|
        @seats[:top] += wagon.top_seats_quantity
        @seats[:lower] += wagon.lower_seats_quantity
      end
      @seats
    end
  end
end
