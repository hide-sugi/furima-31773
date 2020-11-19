## users テーブル

| Column             | Type     | Options                  |
|--------------------|----------|--------------------------|
| nickname           | string   | null: false              |
| email              | string   | null: false, unique:true |
| encrypted_password | string   | null: false              |
| family_name        | string   | null: false              |
| first_name         | string   | null: false              |
| family_name_kana   | string   | null: false              |
| first_name_kana    | string   | null: false              |
| birth_date         | date     | null: false              |


### Association
- has_many :items
- has_many :purchase_records


## items テーブル

| Column                 | Type       | Options                        |
|------------------------|------------|--------------------------------|
| name                   | string     | null: false                    |
| item_explanation       | text       | null: false                    |
| item_category_id       | integer    | null: false                    |
| item_condition_id      | integer    | null: false                    |
| delivery_fee_status_id | integer    | null: false                    |
| shipping_prefecture_id | integer    | null: false                    |
| preparation_day_id     | integer    | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :purchase_record


## purchase_records テーブル

| Column              | Type       | Options                        |
|---------------------|------------|--------------------------------|
| item                | references | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |


### Association
- belongs_to :item
- belongs_to :user
- has_one :delivery_address


## delivery_addresses テーブル

| Column                 | Type       | Options                        |
|------------------------|------------|--------------------------------|
| postal_code            | string     | null: false                    |
| delivery_prefecture_id | integer    | null: false                    |
| municipality           | string     | null: false                    |
| house_number           | string     | null: false                    |
| building               | string     |                                |
| phone_number           | string     | null: false                    |
| user                   | references | null: false, foreign_key: true |
| item                   | references | null: false, foreign_key: true |


### Association
- belongs_to :purchase_record