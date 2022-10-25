module Wagons
  class CreateForm

    def initialize(type)
      @type = type
    end

    def call
      forms = {
        'CoupeWagon' => [:lower_seats_quantity, :top_seats_quantity],
        'EconomyWagon' => [:lower_seats_quantity, :top_seats_quantity, :side_lower_seats_quantity, :side_top_seats_quantity],
        'SleepingWagon' => [:lower_seats_quantity],
        'SeatedWagon' => [:seated_seats_quantity]
      }
      forms[@type]
    end
  end
end
