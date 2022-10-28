class User < ApplicationRecord
  has_many :tickets
  validates_format_of :passport_code, with: /\A\d{9}\z/, message: 'Must contain 9 digits'
  validates :name, presence: true
end