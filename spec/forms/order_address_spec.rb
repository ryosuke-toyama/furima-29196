require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end
  describe '商品購入機能' do
    it '必須項目があると登録できる' do
      expect(@order_address).to be_valid
    end
    it '郵便番号がないと登録できない' do
      @order_address.postal_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号に-(ハイフン)がないと登録できない' do
      @order_address.postal_code = '1111111'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code Input correctly")
    end
    it '都道府県がないと登録できない' do
      @order_address.prefectures_id = 0
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefectures Select")
    end
    it '市区町村がないと登録できない' do
      @order_address.city = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it '番地がないと登録できない' do
      @order_address.address = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号がないと登録できない' do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号が12桁以上だと登録できない' do
      @order_address.phone_number = '111111111111'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number Input correctly")
    end
  end

end
