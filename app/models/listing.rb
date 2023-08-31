class Listing < ApplicationRecord



  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_many :invoices, through: :bookings

  validates :address, presence: true
  validates :price, presence: true
  validates :boat_description, presence: true
  validates :capacity, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?


  include PgSearch::Model
  pg_search_scope :search_by_title_and_address,
    against: [ :title, :address, :price ],
    using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
