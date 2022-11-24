module Tickets
  class TicketsSaver

    def initialize(params)
      @params = params
    end

    def save
      save_user
      find_train
      save_ticket
      @ticket
    end

    private

    def save_user
      @user = User.create(name: @params[:name], passport_code: @params[:passport_code])
      raise ValidationError, @user.errors.full_messages if @user.invalid?
    end

    def find_train
      train = Train.includes(route: :routes_stations).find_by_id(@params[:train_id])
      @train_stations = train.route.routes_stations
    end

    def save_ticket
      @ticket = Ticket.new(user_id: @user.id, train_id: @params[:train_id])
      @ticket.last_station_id = @train_stations.last_station.first.station_id
      @ticket.first_station_id = @train_stations.first_station.first.station_id
      unless @ticket.save
        @user.destroy
        raise ValidationError, @ticket.errors.full_messages 
      end
    end
  end
end
