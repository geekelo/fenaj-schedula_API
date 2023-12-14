class User < ApplicationRecord
  has_secure_password

  has_many :reservations
  has_many :items, dependent: :destroy
  has_many :items, through: :reservations, source: :item
end
