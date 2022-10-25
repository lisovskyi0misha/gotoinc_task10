class WagonsController < ApplicationController

  before_action :create_wagon, only: [:new, :create]
  before_action :find_wagon, only: [:edit, :update, :destroy, :show]

  def index
    @wagons = Wagon.includes(:train).all
  end

  def show
    # binding.break
  end

  def new
  end

  def create
    @wagon.attributes = wagon_params
    @wagon.save
    redirect_to wagons_path
  end

  def edit
  end

  def update
    @wagon.update(wagon_params)
    redirect_to wagons_path
  end

  def destroy
    @wagon.destroy
    redirect_to wagons_path
  end

  private

  def create_wagon
    @wagon = Wagon.new
  end

  def find_wagon
    @wagon = Wagon.find_by_id(params[:id])
  end

  def wagon_params
    params.require(:wagon).permit(:wagon_type, :top_seats_quantity, :lower_seats_quantity, :train_id)
  end
end
