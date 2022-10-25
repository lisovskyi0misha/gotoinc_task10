class WagonsController < ApplicationController

  before_action :create_wagon, only: [:new, :create]
  before_action :find_wagon, only: [:edit, :update, :destroy, :show]

  def index
    @wagons = Wagon.includes(:train).all
  end

  def show
  end

  def choose_type
  end

  def new
    @form_inputs = Wagons::CreateForm.new(params[:wagon_type]).call
  end

  def create
    @wagon = Wagon.create(wagon_params)
    raise StandardError, @wagon.errors.full_messages if @wagon.invalid?
    redirect_to train_path(params[:train_id])
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
    params.require(:wagon).permit(:type, :top_seats_quantity, :lower_seats_quantity, :side_lower_seats_quantity,
      :side_top_seats_quantity, :seated_seats_quantity, :train_id)
  end
end
