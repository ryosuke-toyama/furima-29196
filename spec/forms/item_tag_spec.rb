require 'rails_helper'

RSpec.describe ItemTag, type: :model do
  before do
    @item = FactoryBot.build(:item_tag)
    @item.images = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品機能' do
    it '画像がないと登録できない' do
      @item.images = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('画像を入力してください')
    end
    it '商品名がないと登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('商品名を入力してください')
    end
    it '商品の説明がないと登録できない' do
      @item.message = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('商品の説明を入力してください')
    end
    it 'カテゴリーの情報がないと登録できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
    end
    it '商品の状態についての情報がないと登録できない' do
      @item.sales_status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('商品の状態を選択してください')
    end
    it '配送料の負担についての情報がないと登録できない' do
      @item.shipping_fee_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
    end
    it '発送元の地域についての情報がないと登録できない' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
    end
    it '発送までの日数についての情報がないと登録できない' do
      @item.scheduled_delively_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
    end
    it '価格についての情報がないと登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('価格を入力してください')
    end
    it '価格の範囲が300より低いと登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
    end
    it '価格の範囲が9999999より高いと登録できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('価格は9999999以下の値にしてください')
    end
    it '価格が全角数字だと登録できない' do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('価格は半角数字で入力してください')
    end
  end
end
