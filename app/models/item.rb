class Item < ApplicationRecord

  belongs_to :user
  belongs_to :category
  belongs_to :brand,   optional: true
  has_many :images,    dependent: :destroy
  has_many :orders
  has_many :comments

  validates :name,            presence: true
  validates :name,            length: { maximum: 40 }
  validates :introduction,    presence: true
  validates :introduction,    length: { maximum: 1000 }
  validates :category_id,     presence: true
  validates :condition,       presence: true
  validates :postage_payer,   presence: true
  validates :prefecture_code, presence: true
  validates :preparation_day, presence: true
  validates :price,           numericality: { only_integer: true, greater_than: 300, less_than_or_equal_to: 9999999 }
  validates :trading,         presence: true
  validates :user_id,         presence: true

end
