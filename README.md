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
- has_many :deals

## items テーブル

| Column  | Type   | Options                        |
| ------- | ------ | ------------------------------ |
| user_id | int    | null: false, foreign_key: true |
| price   | int    | null: false                    |

### Association

- belongs_to :user
- has_one :deal

## deals

| Column  | Type | Options                        |
| ------- | ---- | ------------------------------ |
| user_id | int  | null: false, foreign_key: true |
| item_id | int  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses

| Column        | Type   | Options                        |
| ------------- | ------ | ------------------------------ |
| deal_id       | int    | null: false, foreign_key: true |
| postal_code   | string | null: false                    |
| prefecture    | string | null: false                    |
| city          | string | null: false                    |
| house_number  | string | null: false                    |
| building_name | string |                                |
| phone_number  | int    | null: false                    |

### Association

- belongs to :deal