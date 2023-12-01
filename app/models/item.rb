class Item < ApplicationRecord
  has_many :reservations, dependent: :destroy
  belongs_to :user, dependent: :destroy

  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :spa_session_fee, presence: true, numericality: { greater_than: 0 }
  validates :registration_fee, presence: true, numericality: { greater_than: 0 }
  validates :total_amount_payable, presence: true, numericality: { greater_than: 0 }
  validates :duration, presence: true
end
