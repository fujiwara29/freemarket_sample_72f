require 'rails_helper'

RSpec.describe SnsCredential, type: :model do
  describe sns_credenial do
    describe '#create' do
      it "providerがない場合は登録できないこと" do
        sns_credenial = Sns_credenial.new(provider: "", uid: "1", user: "1")
        sns_credenial.valid?
       expect(address.errors[:provider]).to include("can't be blank")
      end
    end
  end
end
