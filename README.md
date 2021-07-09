# テーブル設計

## users テーブル

| Column             | Type   | Options      |
| ------------------ | ------ | ------------ |
| email              | string | unique: true |
| encrypted_password | string | null: false  |
| nickname           | string | null: false  |
| last_name          | string | null: false  |
| last_name_kana     | string | null: false  |
| first_name         | string | null: false  |
| first_name_kana    | string | null: false  |
| birthdate          | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル 
<!-- 商品の情報 -->

| Column             | Type          | Options           |
| ------------------ | ------------- | ----------------- |
| @item.name         | string        | null: false       |
| item_description   | text          | null: false       |
| selling_price      | integer       | null: false       |
| category_id        | integer       | null: false       |
| item_state_id      | integer       | ----------------- |
| delivery_burden_id | integer       | null: false       |
| delivery_area_id   | integer       | null: false       |
| delivery_day_id    | integer       | null: false       |
| user               | references    | foreign_key: true |



### Association

- belongs_to :user
- has_one :address

## orders テーブル
<!-- 購入記録 -->

| Column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| user      | references | foreign_key: true |
| item      | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル
<!-- 配送先情報 -->

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| postal_code      | string     | null: false       |
| city             | string     | null: false       |
| block            | string     | null: false       |
| building         | string     | ----------------- |
| phone_number     | string     | null: false       |
| order            | references | foreign_key: true |
| delivery_area_id | references |                   |

### Association

- belongs_to :address