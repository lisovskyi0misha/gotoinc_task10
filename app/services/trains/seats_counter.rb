module Trains
  class SeatsCounter
    
    def initialize(wagons)
      @wagons = wagons
    end

    def count
      @seats = {top: 0, lower: 0, side_top: 0, side_lower: 0, seated: 0}
      @wagons.each do |wagon|
        @seats[:top] += wagon.top_seats_quantity unless wagon.top_seats_quantity.nil?
        @seats[:lower] += wagon.lower_seats_quantity unless wagon.lower_seats_quantity.nil?
        @seats[:side_lower] += wagon.side_lower_seats_quantity unless wagon.side_lower_seats_quantity.nil?
        @seats[:side_top] += wagon.side_lower_seats_quantity unless wagon.side_lower_seats_quantity.nil?
        @seats[:seated] += wagon.seated_seats_quantity unless wagon.seated_seats_quantity.nil?
      end
      @seats
    end
  end
end
