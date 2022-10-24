class Wagon < ApplicationRecord
  
  belongs_to :train
  before_create :order_number
  validates_uniqueness_of :order_number, scope: :train_id

  private

  def order_number
    self.order_number = self.train.wagons.count + 1
  end
end
