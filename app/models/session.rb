class Session < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations

  has_one_attached :image

  validates :name, presence: true
end
