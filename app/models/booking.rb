class Booking < ApplicationRecord
  belongs_to :listing
  belongs_to :user
  has_one :review
  has_one :invoice

  validates :start_date, presence: true
  validates :end_date, presence: true
end
