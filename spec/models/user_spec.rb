require 'rails_helper'
describe User do
  describe '#create' do
    it "birth_dayがない場合は登録できないこと" do
     user = User.new(birth_day: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
     user.valid?
     expect(user.errors[:biryh_day]).to include("can't be blank")
    end
  end
end