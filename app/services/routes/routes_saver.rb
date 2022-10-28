module Routes
  class RoutesSaver
    def initialize(params)
      @params = params
    end

    def save
      @route = Route.create(title: @params[:title])
      @route.save
      RoutesStation.create(route_id: @route.id, station_id: @params[:first_station], status: :first_station, order_number: 1)
      RoutesStation.create(route_id: @route.id, station_id: @params[:last_station], status: :last_station)
    end
  end
end