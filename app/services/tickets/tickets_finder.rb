module Tickets
  class TicketsFinder

    def initialize(stations)
      @first_station = stations[:first_station]
      @last_station = stations[:last_station]
    end

    def find 
      Ticket.where(first_station_id: @first_station, last_station_id: @last_station ).includes(train: {route: :routes_stations.ordered})
    end
  end
end