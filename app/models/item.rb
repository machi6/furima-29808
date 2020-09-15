class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  validates :name, :price, :description, :category_id, :condition_id, :delivery_fee_payer_id, :lead_time_id, :shipping_origin_prefecture_id, presence: true
  validates :image, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300}
  validates :price, numericality: { less_than_or_equal_to: 9_999_999}

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
