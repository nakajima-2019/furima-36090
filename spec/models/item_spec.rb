require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品登録' do
    context '新規出品できるとき' do
      it 'name,description,image,category,item_state,delivery_burden,delivery_area,delivery_day,selling_priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規出品できないとき' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'categoryが空では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'item_stateが空では登録できない' do
        @item.item_state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Item state can't be blank"
      end
      it 'delivery_burdenが空では登録できない' do
        @item.delivery_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery burden can't be blank"
      end
      it 'delivery_areaが空では登録できない' do
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery area can't be blank"
      end
      it 'delivery_dayが空では登録できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery day can't be blank"
      end
      it 'selling_priceが空では登録できない' do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Selling price can't be blank"
      end
      it 'selling_priceが300未満では登録できない' do
        @item.selling_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Selling price out of range'
      end
      it 'selling_priceが9,999,999より大きいと登録できない' do
        @item.selling_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Selling price out of range'
      end
      it 'selling_priceが全角数字だと登録できない' do
        @item.selling_price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Selling price out of range'
      end
      it 'selling_priceが半角英数混合では登録できないこと' do
        @item.selling_price = '123abc'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Selling price out of range'
      end
      it 'selling_priceが半角英語だけでは登録できないこと' do
        @item.selling_price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Selling price out of range'
      end
      it 'user情報がないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
