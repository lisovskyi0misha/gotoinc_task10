class StationsController < ApplicationController
  before_action :set_station, only: %i[ show edit update destroy ]

  def index
    @stations = Station.all
  end

  def show
  end

  def new
    @station = Station.new
  end

  def edit
  end

  def create
    @station = Station.new(station_params)
  end

  def update
     @station = Station.update(station_params)
  end

  def destroy
    @railway_station.destroy
  end

  private

  def set_station
    @station = Station.find(params[:id])
  end

  def station_params
    params.require(:station).permit(:title)
  end
end
