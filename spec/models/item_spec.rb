require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
    context "商品出品がうまくいく時" do
      it "image, name, info, category_id, condition_id, postage_payer_id, prefecture_id, handling_time_idが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end
    context "商品出品がうまくいかない時" do
      it "imageが空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空だと出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "infoが空だと出品できない" do
        @item.info = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it "category_idが空だと出品できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "condition_idが空だと出品できない" do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "postage_payer_idが空だと出品できない" do
        @item.postage_payer_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage payer can't be blank")
      end
      it "prefecture_idが空だと出品できない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "priceが空だと出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが300円より低いと出品できない" do
        @item.price = "200"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it "priceが9,999,999円より高いと出品できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it "priceは半角数字で入力しないと出品できない" do
        @item.price = "１００００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
    end
  end
end
