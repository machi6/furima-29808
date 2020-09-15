FactoryBot.define do
  factory :order_address do
    user {1}
    item {1}
    order {1}
    postal_code {'111-1111'}
    prefecture_id {2}
    city {'千代田区'}
    house_number {'千代田1-1'}
    building_name {'宮内庁'}
    phone_number {'11111111111'}
  end
end
