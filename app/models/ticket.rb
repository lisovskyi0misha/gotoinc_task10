class Ticket < ApplicationRecord
  belongs_to :first_station, class_name: 'Station'
  belongs_to :last_station, class_name: 'Station'
  belongs_to :train
  belongs_to :user
  validates_format_of :owner_passport, with: /\A\d{9}\z/, message: 'Must contain 9 digits'
  validates :owner_name, presence: true
  
  after_create :send_email
  after_destroy :send_deleted_ticket_email

  def name
    "#{first_station.title} - #{last_station.title}"
  end

  private

  def send_email
    TicketsMailer.send_ticket(self.user, self).deliver_now
  end

  def send_deleted_ticket_email
    TicketsMailer.deleted_ticket(self.user, self).deliver_now
  end
end
