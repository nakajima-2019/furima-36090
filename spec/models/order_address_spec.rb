require 'rails_helper'

RSpec.describe OrderAddress, type: :model do

  describe '商品購入' do

    context '商品購入できるとき' do
      it '必須項目が存在すれば登録できる' do
        expect(@order_address).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'user情報がないと登録できない' do
        @order_address.user = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "User must exist"
      end
      it 'item情報がないと登録できない' do
        @order_address.item = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Item must exist"
      end
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空では登録できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal codecan't be blank"
      end
      it 'delivery_area_idが空では登録できない' do
        @order_address.delivery_area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Delivery area can't be blank"
      end
      it 'cityが空では登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City can't be blank"
      end
      it 'blockが空では登録できない' do
        @order_address.block = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Block can't be blank"
      end
      it 'phone_numberが空では登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'が空では登録できない' do
        @order_address. = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include " can't be blank"
      end
    end
  end
end
