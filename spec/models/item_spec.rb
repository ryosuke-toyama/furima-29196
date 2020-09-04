require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image= fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品機能' do
    it '画像がないと登録できない' do
      @item.image = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名がないと登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明がないと登録できない' do
      @item.message = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Message can't be blank")
    end
    it 'カテゴリーの情報がないと登録できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Select')
    end
    it '商品の状態についての情報がないと登録できない' do
      @item.sales_status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Sales status Select')
    end
    it '配送料の負担についての情報がないと登録できない' do
      @item.shipping_fee_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping fee Select')
    end
    it '発送元の地域についての情報がないと登録できない' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture Select')
    end
    it '発送までの日数についての情報がないと登録できない' do
      @item.scheduled_delively_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Scheduled delively Select')
    end
    it '価格についての情報がないと登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格の範囲が300より低いと登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it '価格の範囲が9999999より高いと登録できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
    it '価格が全角数字だと登録できない' do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end
