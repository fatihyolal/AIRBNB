class Listing < ApplicationRecord
  belongs_to :user
  has_many :reviews, through: :bookings
  has_many :invoices, through: :bookings

  validates :address, presence: true
  validates :price, presence: true
  validates :boat_description, presence: true
  validates :capacity, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
