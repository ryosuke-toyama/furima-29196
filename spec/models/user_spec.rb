require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー情報' do
    it 'ニックネームが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'メールアドレスが空だと登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'メールアドレスが重複していると登録できない' do
      @user.save
      @other_user = FactoryBot.build(:user)
      @other_user.email = @user.email
      @other_user.valid?

      expect(@other_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスは＠を含まないと登録できない' do
      @user.email = 'aaaaa.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'パスワードが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードが５文字以下だと登録できない' do
      @user.password = 'aaa12'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'パスワードが英字のみだと登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end
    it 'パスワードが数字のみだと登録できない' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end
    it 'パスワードが全角英字のみだと登録できない' do
      @user.password = 'ａａａａａａａ'
      @user.password_confirmation = 'ａａａａａａａ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end
    it 'パスワード確認が相違していると登録できない' do
      @user.password = 'aaa123'
      @user.password_confirmation = 'bbb321'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
  describe '本人確認情報' do
    it 'ユーザーの姓が空だと登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it 'ユーザーの姓は全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.family_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name Full-width characters')
    end
    it 'ユーザーの名が空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'ユーザーの名は全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.first_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Full-width characters')
    end
    it 'ユーザーの姓（カナ）が空だと登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it 'ユーザーの姓(カナ)は全角（カタカナ）でないと登録できない' do
      @user.family_name_kana = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana Full-width katakana characters')
    end
    it 'ユーザーの名（カナ）が空だと登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'ユーザーの名（カナ）は全角（カタカナ）でないと登録できない' do
      @user.first_name_kana = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
    end
    it '誕生日が空だと登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
