require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_kanaとfirst_name_kana、birthdateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "ニックネームを入力してください"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールを入力してください"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードを入力してください", "パスワードは6文字以上で入力してください", "パスワードは不正な値です", "パスワード（確認用）とパスワードの入力が一致しません"
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字を入力してください", "苗字は不正な値です"
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字カナを入力してください", "苗字カナは不正な値です"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "名前を入力してください", "名前は不正な値です"
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "名前カナを入力してください", "名前カナは不正な値です"
      end
      it 'birthdateが空では登録できない' do
        @user.birthdate = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "生年月日を入力してください"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください", "パスワードは不正な値です")
      end
      it 'メールアドレスに＠が無いので登録できない' do
        @user.email = '111.com'
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールは不正な値です"
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'aaabbb'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません", "パスワードは不正な値です"
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません", "パスワードは不正な値です"
      end
      it 'last_nameが英数字が混じると登録できない' do
        @user.last_name = 'あイ漢a1'
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字は不正な値です"
      end
      it 'last_name_kanaが英数字、漢字、ひらがなが混じると登録できない' do
        @user.last_name_kana = 'あイ漢a1'
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字カナは不正な値です"
      end
      it 'first_nameが英数字が混じると登録できない' do
        @user.first_name = 'あイ漢a1'
        @user.valid?
        expect(@user.errors.full_messages).to include "名前は不正な値です"
      end
      it 'first_name_kanaが英数字、漢字、ひらがなが混じると登録できない' do
        @user.first_name_kana = 'あイ漢a1'
        @user.valid?
        expect(@user.errors.full_messages).to include "名前カナは不正な値です"
      end
    end
  end
end
