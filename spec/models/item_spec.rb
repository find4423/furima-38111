require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品" do
    context "保存できる場合" do
      it "各項目があればできる" do
        expect(@item).to be_valid
      end
    end
    context "保存できない場合" do
      it "imageが空だとできない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空だとできない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "explanationが空だとできない" do 
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "category_idが0のままだとできない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "condition_idが0のままどとできない" do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "pref_idが0のままだとできない" do
        @item.pref_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Pref can't be blank")
      end
      it "shipping_charge_idが0のままできない" do
        @item.shipping_charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it "delivery_idが0のままだとできない" do
        @item.delivery_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery can't be blank")
      end
      it "priceが空だとできない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが300未満だとできない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが9999999より上だとできない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
