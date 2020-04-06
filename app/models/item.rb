class Item < ApplicationRecord

  accepts_nested_attributes_for :images, allow_destroy: true

  belongs_to :user
  belongs_to :category
  belongs_to :brand
  has_many :images, dependent: :destroy
  has_many :orders
  has_many :comments

end