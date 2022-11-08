class Admin::RoutesController < Admin::BaseController

  before_action :find_route, only: [:show, :edit, :update, :destroy, :edit_stations]
  before_action :set_stations, only: [:show]

  def index
    @routes = Route.includes(:stations, :trains).all
  end

  def show
  end

  def new
  end

  def create
    Routes::RoutesSaver.new(params).save
    redirect_to routes_path
  end

  def edit
    @stations = @route.stations
  end

  def update
    @route.update(route_params)
    @route.stations = Station.where(id: [params[:route][:station_ids].compact_blank])
  end

  def destroy
    Route.destroy(@route.id)
    redirect_to routes_path
  end

  def edit_stations
    @stations = RoutesStation.where(route_id: params[:id]).includes(:station)
  end

  def update_stations
    Stations::RoutesStationsSaver.new(params).save
    redirect_to edit_stations_route_path(id: params[:route_id])
  end

  private

  def find_route
    @route = Route.includes(:trains, :stations).find_by_id(params[:id])
  end

  def set_stations
    @stations = RoutesStation.where(route_id: params[:id]).includes(:station)
  end

  def build_route
    @route = Route.new
  end
end
