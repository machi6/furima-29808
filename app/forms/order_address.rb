class OrderAddress
  include ActiveModel::Model
  attr_accessor :user, :item, :order, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number

  validates :user,          presence: true
  validates :item,          presence: true
  validates :order,         presence: true
  validates :postal_code,   presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :city,          presence: true
  validates :house_number,  presence: true
  validates :phone_number,  presence: true, format: {with: /[0-9]{,11}/, message: "is invalid. Input 11 or less numbers."}

end