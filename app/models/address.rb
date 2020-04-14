class Address < ApplicationRecord
    belongs_to :user, optional: true
    validates :post_code,presence: true

    VALID_POSTAL_CODE = /\A\d{3}-\d{4}\z/

    validates :post_code, format: { with: VALID_POSTAL_CODE}
    validates :prefecture_code, :city, :house_number,presence: true
end
