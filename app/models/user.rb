class User < ApplicationRecord

  devise :database_authenticatable, :registerable,

  validates :phone_number, presence: true, format: { with: /\A\d{10}$|^\d{11}\z/ }
            :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders
  has_many :comments
  has_one :profile
  has_one :address
  has_one :credit_card

end