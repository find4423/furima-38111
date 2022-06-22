require 'rails_helper'

RSpec.describe OrderOrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order_order_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '購入時、保存できる場合' do
      it '各項目があればできる' do
        expect(@order).to be_valid
      end
    end

    context '購入時、保存されない' do
      it 'post_codeがなければできない' do
        @order.post_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeは3桁ハイフン4桁でないとできない' do
        @order.post_code = '00-000'
        @order.valid?
        expect(@order.errors.full_messages).to include('Post code is invalid')
      end
      it 'post_codeは半角文字列だとできない' do
        @order.post_code = '000-000０'
        @order.valid?
        expect(@order.errors.full_messages).to include('Post code is invalid')
      end
      it 'pref_idが0のままだとできない' do
        @order.pref_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include('Pref must be other than 0')
      end
      it 'cityが空だとできない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'address_lineが空だとできない' do
        @order.address_line1 = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address line1 can't be blank")
      end
      it 'numberが空だとできない' do
        @order.number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Number can't be blank")
      end
      it 'numberは10桁以上じゃないとできない' do
        @order.number = '090123412'
        @order.valid?
        expect(@order.errors.full_messages).to include('Number is invalid')
      end
      it 'numberは全角文字ではできない' do
        @order.number = '０９０１２３４１２３４'
        @order.valid?
        expect(@order.errors.full_messages).to include('Number is invalid')
      end
    end
  end
end
