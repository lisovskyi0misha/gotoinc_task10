class Admin::StationsController < Admin::BaseController

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
    @station = Station.create(station_params)
    if @station.valid?
      redirect_to admin_stations_path
    else
      flash[:error] = @station.errors.full_messages.join(', ')
      render :new, status: :unprocessable_entity
    end
  end

  def update
     @station = Station.update(station_params)
  end

  def destroy
    @station.destroy
  end

  private

  def set_station
    @station = Station.find(params[:id])
  end

  def station_params
    params.require(:station).permit(:title)
  end
end
