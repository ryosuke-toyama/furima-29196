require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end
  describe '商品購入機能' do
    it '必須項目があると購入できる' do
      expect(@order_address).to be_valid
    end
    it '建物名は無くても購入できる' do
      @order_address.building_name = ''
      expect(@order_address).to be_valid
    end
    it '郵便番号がないと購入できない' do
      @order_address.postal_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('郵便番号を入力してください')
    end
    it '郵便番号に-(ハイフン)がないと購入できない' do
      @order_address.postal_code = '1111111'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('郵便番号はハイフン(-)を含めた7桁で入力してください')
    end
    it '都道府県がないと購入できない' do
      @order_address.prefectures_id = 0
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('都道府県を選択してください')
    end
    it '市区町村がないと購入できない' do
      @order_address.city = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('市町村を入力してください')
    end
    it '番地がないと購入できない' do
      @order_address.address = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('番地を入力してください')
    end
    it '電話番号がないと購入できない' do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('電話番号を入力してください')
    end
    it '電話番号が12桁以上だと購入できない' do
      @order_address.phone_number = '111111111111'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('電話番号は数字のみの11桁で入力してください')
    end
    it 'トークンが発行されないと購入できない' do
      @order_address.token = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('クレジットカード情報を入力してください')
    end
  end
end
