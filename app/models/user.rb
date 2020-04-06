class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable            

  has_many :items
  has_many :orders
  has_many :comments
  has_one :profile
  has_one :address
  has_one :credit_card

end