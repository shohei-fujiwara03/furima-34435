# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false, unique:true|
| password | string | null: false |
| encrypted_password | string | null: false |
| family_name | string | null: false |
| first_name | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana | string | null: false |
| birth_date | date | null: false |



### Association

- has_many :items
- has_many :payments

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| title   | string | null: false |
| user | reference | null: false, foreign_key: true |
| category | string | null: false |
| condition   | string | null: false |
| price   | integer | null: false |
| details   | text | null: false |
| shipping_fee   | string | null: false |
| sender_region | string | null: false |
| shipping_date | string | null: false |



### Association

- has_one :payment
- belongs_to :user





## payments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping





## shipping テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| zip_code   | integer | null: false |
| prefecture   | string | null: false |
| city   | string | null: false |
| address   | text | null: false |
| phone_number   | string | null: false |


### Association

- belongs_to :payment

