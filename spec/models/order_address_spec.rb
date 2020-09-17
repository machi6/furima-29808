require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end
  describe '決済' do
    context '内容に問題ない場合' do
      it 'すべての情報が正しく入力されていれば購入ができること' do
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが必須であること' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が必須であること' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '都道府県が必須であること' do
        @order_address.prefecture_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町が必須であること' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が必須であること' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が必須であること' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '郵便番号にはハイフンが必要であること' do
        @order_address.postal_code = '1111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '電話番号にはハイフンは不要であること' do
        @order_address.phone_number = '111-1111-1111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input 11 or less numbers.')
      end
      it '電話番号は11桁以内であること' do
        @order_address.phone_number = '111111111110'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input 11 or less numbers.')
      end
    end
  end
end
