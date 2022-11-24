class RoutesController < ApplicationController

  before_action :find_route, only: [:show, :edit, :update, :destroy]
  before_action :build_route, only: [:new, :create]

  def index
    @routes = Route.all
  end

  def show
  end

  def new
  end

  def create
    @route.attributes = route_params
    @route.save
  end

  def edit
  end

  def update
    @route.update(route_params)
  end

  def destroy
    Route.destroy(@route.id)
  end

  private

  def find_route
    @route = Route.includes(:trains, :stations).find_by_id(params[:id])
  end

  def build_route
    @route = Route.new
  end

  def route_params
     params.require(:route).permit(:title)
  end
end
