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
| birth_day        | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                        | Type   | Options                        |
| ----------------------------- | ------ | ------------------------------ |
| user_id                       | int    | null: false, foreign_key: true |
| name                          | string | null: false                    |
| description                   | text   | null: false                    |
| category_id                   | int    | null: false                    |
| condition_id                  | int    | null: false                    |
| delivery_fee_payer_id         | int    | null: false                    |
| shipping_origin_prefecture_id | int    | null: false                    |
| lead_time_id                  | int    | null: false                    |
| price                         | int    | null: false                    |

### Association

- belongs_to :user
- has_one :order

## orders

| Column  | Type | Options                        |
| ------- | ---- | ------------------------------ |
| user_id | int  | null: false, foreign_key: true |
| item_id | int  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses

| Column        | Type   | Options                        |
| ------------- | ------ | ------------------------------ |
| order_id      | int    | null: false, foreign_key: true |
| postal_code   | string | null: false                    |
| prefecture_id | int    | null: false                    |
| city          | string | null: false                    |
| house_number  | string | null: false                    |
| building_name | string |                                |
| phone_number  | string | null: false                    |

### Association

- belongs to :order