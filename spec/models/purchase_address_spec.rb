require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe "商品購入機能" do
    context "商品購入がうまくいく時" do
      it "user_id, item_id, token, postal_code, prefecture_id, city, address, phone_numberが存在すれば購入できること" do
        expect(@purchase_address).to be_valid
      end
      it "buildingが存在しなくても購入できること" do
        @purchase_address.building = nil
        @purchase_address.valid?
        expect(@purchase_address).to be_valid
      end
    end
    context "商品購入がうまくいかない時" do
      it "user_idが空では購入できないこと" do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空では購入できないこと" do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では購入できないこと" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it "postal_codeが空では購入できないこと" do
        @purchase_address.postal_code = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeが半角数字でない場合は購入できないこと" do
        @purchase_address.postal_code = "１２３ー４５６７"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code Input correctly")
      end
      it "postal_codeでハイフンがない場合は購入できないこと" do
        @purchase_address.postal_code = "1234567"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code Input correctly")
      end
      it "postal_codeのハイフンより前が3桁、後ろが4桁でない場合は購入できないこと" do
        @purchase_address.postal_code = "1234-567"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code Input correctly")
      end
      it "prefecture_idが空の場合は購入できないこと" do
        @purchase_address.prefecture_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture Select")
      end
      it "prefecture_idが1以外で選択されていないと購入できないこと" do
        @purchase_address.prefecture_id = "1"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture Select")
      end
      it "cityが空では購入できないこと" do
        @purchase_address.city = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it "addressが空では購入できないこと" do
        @purchase_address.address = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numberが空では購入できないこと" do
        @purchase_address.phone_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが半角数字でない場合は購入できないこと" do
        @purchase_address.phone_number = "１１１１１１１１１１１"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number Input only number")
      end
      it "phone_numberが11桁以内でない場合は購入できないこと" do
        @purchase_address.phone_number = "111122223333"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number Input only number")
      end
      it "phone_numberにハイフンが含まれている場合は購入できないこと" do
        @purchase_address.phone_number = "111-2222-3333"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number Input only number")
      end
    end
  end
end
