class User < ApplicationRecord
  has_secure_password

  has_many :reservations
  has_many :items
  has_many :items, through: :reservations
end
