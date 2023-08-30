class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_many :invoices, through: :bookings

  validates :address, presence: true
  validates :price, presence: true
  validates :boat_description, presence: true
  validates :capacity, presence: true
end
