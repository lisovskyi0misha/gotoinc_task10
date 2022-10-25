class Station < ApplicationRecord
  has_many :routes_stations
  has_many :routes, -> { distinct }, through: :routes_stations, dependent: :destroy
  has_many :tickets_end_from, class_name: 'Ticket', foreign_key: 'last_station_id'
  has_many :tickets_start_from, class_name: 'Ticket', foreign_key: 'first_station_id'
  has_many :trains, foreign_key: 'current_station_id'
  scope :ordered, -> { joins(:routes_stations).order(order_number: :routes_stations) }

  def all_tickets
    Ticket.where(last_station_id: self.id).or(Ticket.where(first_station_id: self.id))
  end
end
