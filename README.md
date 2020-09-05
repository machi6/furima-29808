# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| first_name       | string | null: false |
| family_name      | string | null: false |
| first_name_kana  | string | null: false |
| family_name_kana | string | null: false |
| birth_year       | int    | null: false |
| birth_month      | int    | null: false |
| birth_date       | int    | null: false |

### Association

- has_many :items

## items テーブル

| Column                     | Type   | Options                        |
| -------------------------- | ------ | ------------------------------ |
| seller_id                  | int    | null: false, foreign_key: true |
| category                   | string | null: false                    |
| condition                  | string | null: false                    |
| delivery_fee_payer         | string | null: false                    |
| shipping_origin_prefecture | string | null: false                    |
| lead_time                  | string | null: false                    |
| price                      | int    | null: false                    |

### Association

- belongs_to :users
- has_one : buyers

## buyers

| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| item_id            | int    | null: false, foreign_key: true |
| credit_card_number | int    | null: false                    |
| expiration_month   | int    | null: false                    |
| expiration_year    | int    | null: false                    |
| security_code      | int    | null: false                    |
| postal_code        | string | null: false                    |
| prefecture         | string | null: false                    |
| city               | string | null: false                    |
| house_number       | string | null: false                    |
| building_name      | string | null: false                    |
| phone_number       | int    | null: false                    |

### Association

- belongs_to :buyers