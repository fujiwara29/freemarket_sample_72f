class Item < ApplicationRecord

  belongs_to :user
  belongs_to :category
  belongs_to :brand,   optional: true
  has_many :images,    dependent: :destroy
  has_many :orders
  has_many :comments

end
