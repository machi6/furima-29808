class OrderAddress
  include ActiveModel::Model
  attr_accessor :user, :item, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :token

  validates :token,         presence: true
  validates :user,          presence: true
  validates :item,          presence: true
  validates :postal_code,   presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :city,          presence: true
  validates :house_number,  presence: true
  validates :phone_number,  presence: true, format: {with: /\A[0-9]{,11}\z/, message: 'is invalid. Input 11 or less numbers.'}

  def save
    order = Order.create(user_id: user, item_id: item)

    Address.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number)
  end
end
