require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = '' 
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = '' 
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = '' 
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = '' 
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = '' 
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = '' 
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'birthdateが空では登録できない' do
        @user.birthdate = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthdate can't be blank"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'メールアドレスに＠が無いので登録できない' do
        @user.email = '111.com' 
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'aaabbb'  
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'  
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'last_nameが英数字が混じると登録できない' do
        @user.last_name = 'あイ漢a1'  
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid"
      end
      it 'last_name_kanaが英数字、漢字、ひらがなが混じると登録できない' do
        @user.last_name_kana = 'あイ漢a1' 
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana is invalid"
      end
      it 'first_nameが英数字が混じると登録できない' do
        @user.first_name = 'あイ漢a1' 
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end
      it 'first_name_kanaが英数字、漢字、ひらがなが混じると登録できない' do
        @user.first_name_kana = 'あイ漢a1' 
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid"
      end
    end
  end
end