class OrderAddress
  include ActiveModel::Model
  attr_accessor :user, :item, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :token

  POSTAL_CODE_REGEX = /\A[0-9]{3}-[0-9]{4}\z/.freeze
  PHONE_NUMBER_REGEX = /\A[0-9]{,11}\z/.freeze

  with_options presence: true do
    validates :token
    validates :user
    validates :item
    validates :postal_code,   format: { with: POSTAL_CODE_REGEX, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: PHONE_NUMBER_REGEX, message: 'is invalid. Input 11 or less numbers.'}
  end

  def save
    order = Order.create(user_id: user, item_id: item)

    Address.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number)
  end
end
