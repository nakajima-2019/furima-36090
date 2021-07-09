# テーブル設計

## users テーブル

| Column             | Type   | Options                     |
| ------------------ | ------ | --------------------------- |
| email              | string | unique: true , null: false  |
| encrypted_password | string | null: false                 |
| nickname           | string | null: false                 |
| last_name          | string | null: false                 |
| last_name_kana     | string | null: false                 |
| first_name         | string | null: false                 |
| first_name_kana    | string | null: false                 |
| birthdate          | date   | null: false                 |

### Association

- has_many :items
- has_many :orders

## items テーブル 
<!-- 商品の情報 -->

| Column             | Type          | Options           |
| ------------------ | ------------- | ----------------- |
| name               | string        | null: false       |
| description        | text          | null: false       |
| category_id        | integer       | null: false       |
| state_id           | integer       | null: false       |
| delivery_burden_id | integer       | null: false       |
| delivery_area_id   | integer       | null: false       |
| delivery_day_id    | integer       | null: false       |
| selling_price      | integer       | null: false       |
| user               | references    | foreign_key: true |

### Association

- belongs_to :user
- has_one :orders

## orders テーブル
<!-- 購入記録 -->

| Column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| user      | references | foreign_key: true |
| item      | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :addresses

## addresses テーブル
<!-- 配送先情報 -->

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| postal_code      | string     | null: false       |
| delivery_area_id | integer    | null: false       |
| city             | string     | null: false       |
| block            | string     | null: false       |
| building         | string     | ----------------- |
| phone_number     | string     | null: false       |
| order            | references | foreign_key: true |


### Association

- belongs_to :order