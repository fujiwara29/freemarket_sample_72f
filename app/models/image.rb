class Image < ApplicationRecord
  mount_uploader :src, ImageUploader
  belongs_to :item
  
  # belongs_to :animal, optional: true
  # mount_uploader :image_url, ImageUploader
end
