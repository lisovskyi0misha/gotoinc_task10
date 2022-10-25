class Wagon < ApplicationRecord
  
  belongs_to :train
  before_create :set_order_number
  validates_uniqueness_of :order_number, scope: :train_id
  scope :coupe, -> { where(type: 'CoupeWagon') }
  scope :economy, -> { where(type: 'EconomyWagon') }
  scope :sleeping, -> { where(type: 'SleepingWagon') }
  scope :seated, -> { where(type: 'SeatedWagon') }
  scope :ordered, -> { order(:order_number) }
  scope :reverse_ordered, -> { order(:order_number).reverse_order }

  private
  
  def set_order_number
    self.order_number = self.train.wagons.count + 1
  end
end
