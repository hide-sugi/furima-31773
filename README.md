## users テーブル

| Column           | Type   | Options                  |
|------------------|--------|--------------------------|
| nickname         | string | null: false              |
| email            | string | null: false, unique:true |
| password         | string | null: false              |
| family_name      | string | null: false              |
| first_name       | string | null: false              |
| family_name_kana | string | null: false              |
| first_name_kana  | string | null: false              |
| birth_year       | date   | null: false              |
| birth_month      | date   | null: false              |
| birth_day        | date   | null: false              |


### Association
- has_many :items
- has_many :purchase_records


## items テーブル

| Column              | Type       | Options                        |
|---------------------|------------|--------------------------------|
| item_name           | text       | null: false                    |
| item_explanation    | text       | null: false                    |
| item_category       | string     | null: false                    |
| item_condition      | string     | null: false                    |
| delivery_fee_status | string     | null: false                    |
| shipping_prefecture | string     | null: false                    |
| preparation_day     | string     | null: false                    |
| price               | string     | null: false                    |
| user_id             | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :purchase_record


## purchase_records テーブル

| Column              | Type       | Options                        |
|---------------------|------------|--------------------------------|
| purchase_date       | string     | null: false                    |
| item_name_id        | text       | null: false, foreign_key: true |
| user_id             | references | null: false, foreign_key: true |
| delivery_address_id | references | null: false, foreign_key: true |


### Association
- belongs_to :item
- belongs_to :user
- belongs_to :delivery_address


## delivery_addresses テーブル

| Column              | Type   | Options     |
|---------------------|--------|-------------|
| postal_code         | string | null: false |
| delivery_prefecture | string | null: false |
| municipality        | string | null: false |
| house_number        | string | null: false |
| phone_number        | string | null: false |


### Association
- has_many :purchase_records