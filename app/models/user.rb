class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :listings
  has_many :bookings
  has_many :invoices, through: :bookings
  has_many :reviews, through: :bookings

<<<<<<< HEAD
  validates :email, presence: true
=======
  # validates :name, presence: true

  validates :email, presence: true, uniqueness: true
>>>>>>> 961c249bcd4fdf87580f4c4bd3b48fd78ff452d5
end
