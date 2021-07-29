require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it '必須項目が存在すれば登録できる' do
        expect(@order_address).to be_valid
      end
      it '建物名がなくても登録できる' do
        @order_address.building = nil
        expect(@order_address).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'user情報がないと登録できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Userを入力してください"
      end
      it 'item情報がないと登録できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Itemを入力してください"
      end
      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "クレジットカード情報を入力してください"
      end
      it 'postal_codeが空では登録できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "郵便番号を入力してください", "郵便番号は例のように入力してください(例 123-4567)"
      end
      it 'delivery_area_idが空では登録できない' do
        @order_address.delivery_area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "都道府県は---以外を入力してください"
      end
      it 'cityが空では登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "市区町村を入力してください"
      end
      it 'blockが空では登録できない' do
        @order_address.block = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "番地を入力してください"
      end
      it 'phone_numberが空では登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "電話番号を入力してください", "電話番号は10～11桁の数字のみで入力してください"
      end
      it 'postal_codeが「3桁ハイフン4桁」でないと登録できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "郵便番号は例のように入力してください(例 123-4567)"
      end
      it 'phone_numberが9桁以下では登録できない' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "電話番号は10～11桁の数字のみで入力してください"
      end
      it 'phone_numberが12桁以上では登録できない' do
        @order_address.phone_number = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "電話番号は10～11桁の数字のみで入力してください"
      end
      it 'phone_numberは半角英字のみだと登録できない' do
        @order_address.phone_number = 'abcabcabca'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "電話番号は10～11桁の数字のみで入力してください"
      end
      it 'phone_numberは半角英数字混合だと登録できない' do
        @order_address.phone_number = '123456789a'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "電話番号は10～11桁の数字のみで入力してください"
      end
      it 'phone_numberは全角数字だと登録できない' do
        @order_address.phone_number = '１２３４５６７８９０'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "電話番号は10～11桁の数字のみで入力してください"
      end
    end
  end
end
