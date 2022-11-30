class Admin::TicketsController < Admin::BaseController

  before_action :find_ticket, only: [:show, :update, :edit, :destroy] 

  def index
    @tickets = Ticket.all
  end

  def show
  end

  def edit
  end
  
  def update
    @ticket.update(ticket_params)
  end

  def destroy
    @ticket.destroy
  end

  private

  def find_ticket
    @ticket = Ticket.find_by_id(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:owner_name, :owner_passport, :train_id, :last_station_id, :first_station_id)
  end
end
