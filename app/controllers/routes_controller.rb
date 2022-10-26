class RoutesController < ApplicationController

  before_action :find_route, only: [:show, :edit, :update, :destroy, :edit_stations]
  before_action :build_route, only: [:new, :create]
  before_action :set_stations, only: [:edit_stations, :show]

  def index
    @routes = Route.all
  end

  def show
  end

  def new
  end

  def create
    @route.attributes = route_params
    @route.stations << Station.where(id: [params[:route][:station_ids].compact_blank])
    @route.save
    redirect_to routes_path
  end

  def edit
    @stations = @route.stations
  end

  def update
    @route.update(route_params)
  end

  def destroy
    Route.destroy(@route.id)
    redirect_to routes_path
  end

  def edit_stations
  end

  def update_stations
    Stations::RoutesStationsSaver.new(params).save
    redirect_to route_path(params[:route_id])
  end

  private

  def find_route
    @route = Route.includes(:trains, :stations).find_by_id(params[:id])
  end

  def set_stations
    @stations = Station.select(:title, 'routes_stations.*').joins(:routes_stations).where(routes_stations: {route_id: 17})
  end

  def build_route
    @route = Route.new
  end

  def route_params
     params.require(:route).permit(:title)
  end
end
