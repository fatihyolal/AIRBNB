class Booking < ApplicationRecord
  belongs_to :listing
  belongs_to :user
  has_one :review, dependent: :destroy
  has_one :invoice, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true
end
