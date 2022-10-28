module Trains
  class TrainsFinder

    def initialize(stations)
      @first_station = stations[:first_station]
      @last_station = stations[:last_station]
    end

    def call
      find
      filter
      save_params
      [@result, @station_params]
    end

    private

    def find
      first_station_conditions = {station_id: @first_station, status: :first_station}
      last_station_conditioins = {station_id: @last_station, status: :last_station}
      included_objects = {route: [:routes_stations, :stations]}
      @starting_trains = Train.includes(included_objects).joins(route: :routes_stations).where(routes_stations: first_station_conditions)
      @departing_trains = Train.includes(included_objects).joins(route: :routes_stations).where(routes_stations: last_station_conditioins)
    end

    def filter
      @result = []
      @starting_trains.each do |train|
        @result << train if @departing_trains.ids.include?(train.id)
      end
    end

    def save_params
      @station_params = {}
      @result.each do |train|
        oredered_stations = train.route.routes_stations.ordered
        @station_params[train.id] = {first_station: oredered_stations.first, last_station: oredered_stations.last}
      end
      @station_params
    end
  end
end