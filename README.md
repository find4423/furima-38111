# readme

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birth_day|date|null: false

### Association
- has_many :items
- has_many :orders

## items Table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|explanation|text|null: false|
|category_id|integer|null: false|
|condition_id|integer|null: false|
|shipping_charge_id|integer|null: false|
|pref_id|integer|null: false|
|delivery_id|integer|null: false|
|price|integer|null: false|
|user|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :order

## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|user|reference|null: false, foreign_key: true|
|item|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :order_addresses

## order_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|post_code|string|null: false|
|pref_id|integer|null: false|
|city|string|null: false|
|address_line1|string|null: false|
|address_line2|string|---|
|number|string|null: false|
|order_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :order