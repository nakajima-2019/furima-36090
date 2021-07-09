# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| last_name          | string | null: false |
| last_name_kana     | string | null: false |
| first_name         | string | null: false |
| first_name_kana    | string | null: false |
<!-- | birthdate          | text   | null: false | -->

### Association

- has_many :items
- has_many :orders

## items テーブル 
<!-- 商品の情報 -->


| Column             | Type          | Options     |
| ------------------ | ------------- | ----------- |
| item_name          | string        | null: false |
| item_description   | text          | null: false |
| selling_price      | integer       | null: false |
<!-- | category           | pull          | null: false |
| item_state         | references    |             |
| delivery_burden    | string        | null: false |
| delivery_area      | text          | null: false |
| delivery_day       | text          | null: false | -->


### Association

- belongs_to :users
- has_one :address

## orders テーブル
<!-- 購入記録 -->

| Column    | Type       | Options         |
| --------- | ---------- | --------------- |
| user_id   | references | --------------- |
| item_id   | references | --------------- |
<!-- | card_information      | text       | null: false     |
| expiration_date      | references |                 |
| security_code | references |                 | -->

### Association

- belongs_to :users
- belongs_to :items
- has_one :address

## address テーブル
<!-- 配送先情報 -->

| Column       | Type       | Options         |
| ------------ | ---------- | --------------- |
| postal_code  | text       | null: false     |
| city         | text       | null: false     |
| block        | text       | null: false     |
| building     | text       |                 |
| phone_number | integer    | null: false     |
| order_id     | references | --------------- |
<!-- | prefectures   | references |                 | -->

### Association

- belongs_to :address