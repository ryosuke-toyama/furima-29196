# README

* Ruby version 6.0.0

* Database creation MySQL

* Deployment instructions Heroku

* # テーブル設計

## users テーブル

| Column                | Type       | Options     |
| ----------------------| ---------- | ----------- |
| nickname              | string     | null: false |
| email                 | string     | null: false |
| password              | string     | null: false |
| password_confirmation | string     | null: false |
| family_name           | string     | null: false |
| first_name            | string     | null: false |
| family_name_kana      | string     | null: false |
| first_name_kana       | string     | null: false |
| birthday              | date       | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column                              | Type       | Options                        |
| ----------------------------------- | ---------- | ------------------------------ |
| img                                 | text       | null: false                    |
| name                                | string     | null: false                    |
| message                             | text       | null: false                    |
| price                               | integer    | null: false                    |
| user                                | references | null: false, foreign_key: true |
| category_id(active_hash)            | integer    | null: false                    |
| sales_status_id(active_hash)        | integer    | null: false                    |
| shipping_fee_status_id(active_hash) | integer    | null: false                    |
| prefectures_id(active_hash)         | integer    | null: false                    |
| scheduled_delively_id(active_hash)  | integer    | null: false                    |


### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column                      | Type       | Options     |
| --------------------------- | ---------- | ----------- |
| postal_code                 | string     | null: false |
| manicipalities              | string     | null: false |
| address                     | string     | null: false |
| building_name               | string     |             |
| phone_number                | string     | null: false |
| prefectures_id(active_hash) | integer    | null: false |

- belongs_to :purchase