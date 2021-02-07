# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column            | Type      | Options                        |
| ----------------- | --------- | ------------------------------ |
| name              | string    | null: false                    |
| description       | text      | null: false, limit: 40         |
| category_id       | integer   | null: false, limit: 1000       |
| condition_id      | integer   | null: false                    |
| charge_id         | integer   | null: false                    |
| ship_from_area_id | integer   | null: false                    |
| delivery_time_id  | integer   | null: false                    |
| price             | integer   | null: false                    |
| user              | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buyer

## buyers テーブル

| Column | Type      | Options                        |
| ------ | --------- | ------------------------------ |
| user   | reference | null: false, foreign_key: true |
| item   | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column         | Type      | Options                        |
| -------------- | --------- | ------------------------------ |
| zip_code       | string    | null: false                    |
| state          | string    | null: false                    |
| city           | string    | null: false                    |
| address_line_1 | string    | null: false                    |
| address_line_2 | string    |                                |
| phone_number   | string    | null: false                    |
| buyer          | reference | null: false, foreign_key: true |

### Association

- belongs_to :buyer