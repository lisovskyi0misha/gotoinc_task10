class User < ApplicationRecord
  has_many :users_tickets
  has_many :tickets, through: :users_tickets
end