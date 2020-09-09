require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end
  describe '商品登録' do
    it '画像は1枚必須であること(ActiveStorageを使用すること)' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
    it '商品名が必須であること' do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明が必須であること' do
      @item.description = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'カテゴリーの情報が必須であること' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it '商品の状態についての情報が必須であること' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end
    it '配送料の負担についての情報が必須であること' do
      @item.delivery_fee_payer_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee payer must be other than 1")
    end
    it '発送元の地域についての情報が必須であること' do
      @item.shipping_origin_prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping origin prefecture must be other than 1")
    end
    it '発送までの日数についての情報が必須であること' do
      @item.lead_time_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Lead time must be other than 1")
    end
    it '価格についての情報が必須であること' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格の範囲が、¥300~¥9,999,999の間であること(¥300未満の場合)' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it '価格の範囲が、¥300~¥9,999,999の間であること(¥10,000,000以上の場合)' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
    it '販売価格は半角数字のみ入力可能であること' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end
