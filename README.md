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
| birthday              | datetime   | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| img               | text       | null: false                    |
| name              | string     | null: false                    |
| message           | text       | null: false                    |
| category          | string     | null: false                    |
| status            | string     | null: false                    |
| delivery_fee      | integer    | null: false                    |
| shopping_origin   | string     | null: false                    |
| date_of_shipment  | string     | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :purchases

## purchases テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| potal_code       | string     | null: false                    |
| prefectures      | string     | null: false                    |
| manicipalities   | string     | null: false                    |
| address          | string     | null: false                    |
| phone_number     | string     | null: false                    |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items