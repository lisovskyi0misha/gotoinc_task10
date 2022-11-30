class TicketsController < ApplicationController

  before_action :authenticate_user!
  before_action :create_ticket, only: [:new, :create]

  def new
    @train = Train.includes(route: :routes_stations).find_by_id(params[:train_id])
    @train_stations = @train.route.routes_stations
  end

  def create
    @ticket.attributes = ticket_params
    if @ticket.save
      redirect_to ticket_path(id: @ticket)
    else
      flash[:error] = @ticket.errors.full_messages
      redirect_to new_ticket_path(train_id: params[:user][:train_id])
    end
  end

  def show
    @ticket = Ticket.includes(:user, :first_station, :last_station, train: {route: :routes_stations}).find(params[:id])
  rescue
    flash[:error] = t('common.errors.undefined_error')
    redirect_to show_all_ticket_path(user_id: current_user.id)
  end

  def destroy
    Ticket.destroy_by(id: params[:id])
    redirect_to show_all_ticket_path(user_id: current_user.id)
  end

  def show_all
    @tickets = Ticket.where(user_id: params[:user_id])
  end

  def search
  end

  def show_results
    @trains = Trains::TrainsFinder.new(params[:stations_search]).call if params[:stations_search].present?
  end

  private

  def create_ticket
    @ticket = Ticket.new 
  end

  def ticket_params
    params.require(:ticket).permit(:owner_name, :user_id, :owner_passport, :train_id, :last_station_id, :first_station_id)
  end
end
