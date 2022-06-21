require 'rails_helper'

RSpec.describe OrderOrderAddress, type: :model do
  before do
    user = FactoryBot.build(:user)
    item = FactoryBot.build(:item)
    order = FactoryBot.build(:order)
    @oreder = FactoryBot.build(:order_order_address, user_id: user.id, item_id: item.id, order_id: order.id)
  end

  describe "商品購入" do
    context "購入時、保存できる場合" do
      it "各項目があればできる" do
        expect(@oreder).to be_valid
      end
    end

    context "購入時、保存されない" do
      it "post_codeがなければできない" do
        @order.post_code = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end
      it "pref_idが0のままだとできない" do
        @order.pref_id = 0
        @order.valid?
        binding.pry
        expect(@order.errors.full_messages).to include("")
      end
      it "cityが空だとできない" do
        @order.city = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it "address_lineが空だとできない" do
        @order.address_line1 = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Address line1 can't be blank")
      end
      it "numberが空だとできない" do
        @order.number = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Number can't be blank")
      end
      it "userが紐づいていないとできない" do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User")
      end
      it "itemが紐づいていないとできない" do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("")
      end
      it "orderが紐づいてないとできない" do
        @order.order_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("")
      end
      it "" do
        
      end
      it "" do
        
      end
      it "" do
        
      end
      it "" do
        
      end
      it "" do
        
      end
      it "" do
        
      end
      it "" do
        
      end
    end
  end
end
