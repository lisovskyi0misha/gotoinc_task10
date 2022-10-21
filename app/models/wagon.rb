class Wagon < ApplicationRecord
  
  belongs_to :train
  enum wagon_type: {passenger: 0, second_class: 1}
end
