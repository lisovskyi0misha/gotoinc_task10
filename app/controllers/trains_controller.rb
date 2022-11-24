class TrainsController < ApplicationController
  before_action :set_train, only: %i[ show edit update destroy ]

  def index
    @trains = Train.all
  end

  def show
  end

  def new
    @train = Train.new
  end

  def edit
  end

  def create
    @train = Train.new(train_params)
  end

  def update
  end

  def destroy
    @train.destroy
  end

  private

    def set_train
      @train = Train.find(params[:id])
    end

    def train_params
      params.require(:train).permit(:number, :route_id, :station_id)
    end
end
