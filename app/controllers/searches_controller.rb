class SearchesController < ApplicationController

  def new
    redirect_to search_path if params[:search].present?
  end
  
  def show
    @tickets = Tickets::TicketsFinder.new(params[:stations_search]).find if params[:stations_search].present?
  end
end