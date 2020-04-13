require 'rails_helper'
describe User do
  require 'rails_helper'
  describe '#create' do
    it "nicknameがない場合は登録できないこと" do
     user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", first_name: "フリマ", family_name: "太郎", first_name_kana: "フリマ", family_name_kana: "タロウ", birth_year: "1990", birth_month: "1", birth_day: "4")
     user.valid?
     expect(user.errors[:nickname]).to include("can't be blank")
    end
  end
end
