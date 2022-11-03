module Wagons
  class CreateForm

    def initialize(type)
      @type = type
    end

    def call
      forms = {
        'coupe' => [:lower_seats_quantity, :top_seats_quantity],
        'economy' => [:lower_seats_quantity, :top_seats_quantity, :side_lower_seats_quantity, :side_top_seats_quantity],
        'sleeping' => [:lower_seats_quantity],
        'seated' => [:seated_seats_quantity]
      }
      forms[@type]
    end
  end
end
