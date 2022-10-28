module Stations
  class RoutesStationsSaver

    def initialize(params)
      @params = params
    end

    def save
      station = RoutesStation.find_by(station_id: @params[:id], route_id: @params[:route_id])
      station.arrival_time = @params[:arrival_time]
      station.departure_time = @params[:departure_time]
      station.order_number = @params[:order_number]
      station.save
    end
  end
end
