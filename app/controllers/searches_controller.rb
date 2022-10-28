class SearchesController < ApplicationController

  def new
    redirect_to search_path if params[:search].present?
  end
  
  def show
    @trains = Trains::TrainsFinder.new(params[:stations_search]).call if params[:stations_search].present?
  end
end