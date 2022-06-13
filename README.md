# readme

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|

### Association
- has_many :items
- has_many :orders

## items Table
|Column|Type|Options|
|------|----|-------|
|item|string|null: false|
|explanation|text|null: false|
|category_id|integer|null: false|
|condition_id|integer|null: false|
|shipping_charge_id|integer|null: false|
|shipping_area_id|integer|null: false|
|delivery_id|integer|null: false|
|price|integer|null: false|
|user|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :order

## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|price|integer|null: false|
|user|reference|null: false, foreign_key: true|
|item|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_many :order_addresses

## order_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|post_code|integer|null: false|
|pref|string|null: false|
|city|string|null: false|
|address|string|null: false|
|number|integer|null: false|

### Association
- belongs_to :order