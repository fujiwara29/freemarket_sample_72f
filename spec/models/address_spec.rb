require 'rails_helper'

RSpec.describe Address, type: :model do
  describe Address do
    describe '#create' do
      it "post_codeがない場合は登録できないこと" do
       address = Address.new(post_code: "", prefecture_code: "東京", city: "杉並区", house_number: "22", building_name: "ビル", user_id: "1")
       address.valid?
       expect(address.errors[:post_code]).to include("can't be blank")
      end
    end
  end
end
