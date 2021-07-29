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
        expect(@item.errors.full_messages).to include "商品名を入力してください"
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の説明を入力してください"
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "商品画像を入力してください"
      end
      it 'categoryが空では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリーは---以外を入力してください"
      end
      it 'item_stateが空では登録できない' do
        @item.item_state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の状態は---以外を入力してください"
      end
      it 'delivery_burdenが空では登録できない' do
        @item.delivery_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "配送料の負担は---以外を入力してください"
      end
      it 'delivery_areaが空では登録できない' do
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "発送元の地域は---以外を入力してください"
      end
      it 'delivery_dayが空では登録できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "発送までの日数は---以外を入力してください"
      end
      it 'selling_priceが空では登録できない' do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格を入力してください", "販売価格は範囲内の金額を入力してください", "販売価格は半角数字で入力してください"
      end
      it 'selling_priceが300未満では登録できない' do
        @item.selling_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格は範囲内の金額を入力してください"
      end
      it 'selling_priceが9,999,999より大きいと登録できない' do
        @item.selling_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格は範囲内の金額を入力してください"
      end
      it 'selling_priceが全角数字だと登録できない' do
        @item.selling_price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格は範囲内の金額を入力してください"
      end
      it 'selling_priceが半角英数混合では登録できないこと' do
        @item.selling_price = '123abc'
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格は範囲内の金額を入力してください"
      end
      it 'selling_priceが半角英語だけでは登録できないこと' do
        @item.selling_price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格は範囲内の金額を入力してください"
      end
      it 'user情報がないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Userを入力してください"
      end
    end
  end
end
