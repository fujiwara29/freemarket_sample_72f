class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :phone_number, presence: true,             format: { with: /\A\d{10}$|^\d{11}\z/ }
  # validates :first_name, format: {/^[ぁ-んァ-ン一-龥]/}
  # validates :family_name, format: {/^[ぁ-んァ-ン一-龥]/}  
end
