class TicketsController < ApplicationController

  before_action :create_user, only: [:new, :create]

  def buy_ticket
    binding.break
  end

  def new
    @train_id = params[:train_id]
  end

  def create
    ticket = Tickets::TicketsSaver.new(params[:user]).save
    redirect_to ticket_path(id: ticket.id)
  rescue ValidationError => e
    # flash[:error] = e.message
    redirect_to new_ticket_path(train_id: params[:user][:train_id])
  end

  def show
    @ticket = Ticket.includes(:user, :first_station, :last_station, train: {route: :routes_stations}).find_by_id(params[:id])
  end

  private

  def create_user
    @user = User.new 
  end
end