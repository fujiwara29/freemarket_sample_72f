class Item < ApplicationRecord

accepts_nested_attributes_for :images

  belongs_to :user
  belongs_to :category
  belongs_to :brand
  has_many :images, dependent: :destroy
  has_many :orders
  has_many :comments


#   #imageのバリデーション
#   def images_presence
#     if images.attached?
#       # inputに保持されているimagesがあるかを確認
#       if images.length > 10
#         errors.add(:image, '10枚まで投稿できます')
#       end
#     else
#       errors.add(:image, '画像がありません')
#     end
#   end
end