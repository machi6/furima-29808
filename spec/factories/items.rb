FactoryBot.define do
  factory :item do

    user_id {1}
    name {'革ジャン'}
    description {'一度しか着ていない革ジャンです。'}
    category_id {2}
    condition_id {2}
    delivery_fee_payer_id {2}
    shipping_origin_prefecture_id {2}
    lead_time_id {2}
    price {300}
  end
end
