require 'rails_helper'

RSpec.describe Item, type: :model do
  describe Item do
    describe '#self.search' do
    before do 
      @item = Item.create(
        name: "画像", 
      ) 

      @other_item = Item.create(
        name: "ワンピース", 
      ) 
    end   

    # "画像"で検索した場合
    context "search by '画像" do
      it "returns @item" do
        expect(Item.search("画像")).to include(@item)
      end
    
      example "@other_itemを返さない" do
        expect(Item.search("画像")).to_not include(@other_item)
      end
    end

    # "あああ"で検索した場合
    context "search by 'あああ'" do
            # 空を返す
            expect(Item.search("あああ")).to be_empty
      end
    end
  end
end
