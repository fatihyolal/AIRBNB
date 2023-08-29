class Listing < ApplicationRecord
  belongs_to :user
  has_many :reviews, through: :bookings
  has_many :invoices, through: :bookings
end
