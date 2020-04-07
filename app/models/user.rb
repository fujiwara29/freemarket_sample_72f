class User < ApplicationRecord


  validates :nickname, presence: true

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable         

  has_many :items
  has_many :orders
  has_many :comments
  has_one :profile
  has_one :address
  has_one :credit_card

  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  VALID_KATAKANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
 
   
  validates :family_name_kana, length: { maximum: 35 }, format: { with: VALID_KATAKANA_REGEX}
  validates :first_name_kana, length: { maximum: 35 }, format: { with: VALID_KATAKANA_REGEX} 
  validates :birth_year, :birth_month, :birth_day, presence: true
  
  # validates :phone_number,    

end