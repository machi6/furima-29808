class Item < ApplicationRecord
  belongs_to :user
  #has_one :deal

  validates :user_id, :name, :price, :description, :category, :condition, :delivery_fee_payer, :lead_time, :shipping_origin_prefecture, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300}
  validates :price, numericality: { less_than_or_equal_to: 9999999}

  with_options format: { with: \d, message: '英字と数字の両方を含めて設定してください' } do
    validates :password
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee_payer
  belongs_to_active_hash :lead_time
  belongs_to_active_hash :shipping_origin_prefecture

  with_options numericality: { other_than: 1} do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_payer_id
    validates :lead_time_id
    validates :shipping_origin_prefecture_id
  end

end
