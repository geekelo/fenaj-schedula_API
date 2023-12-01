class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :session

  validates :user, presence: true
  validates :session, presence: true
  validates :city, presence: true
  validates :date, presence: true
end
