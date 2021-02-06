# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birthday        | string | null: false |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column         | Type      | Options                        |
| -------------- | --------- | ------------------------------ |
| name           | text      | null: false                    |
| description    | text      | null: false, limit: 40         |
| category       | string    | null: false, limit: 1000       |
| condition      | string    | null: false                    |
| charge         | string    | null: false                    |
| ship_from_area | string    | null: false                    |
| delivery_time  | string    | null: false                    |
| price          | int       | null: false                    |
| user           | reference | null: false, foreign_key: true |

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
| zip_code       | int       | null: false                    |
| state          | string    | null: false                    |
| city           | string    | null: false                    |
| address_line_1 | string    | null: false                    |
| address_line_2 | string    |                                |
| phone_number   | int       | null: false                    |
| buyer          | reference | null: false, foreign_key: true |

### Association

- belongs_to :buyer