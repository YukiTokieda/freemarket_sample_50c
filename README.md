# DB設計

## Userテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_many :comments, dependent: :destroy
- has_many :products, dependent: :destroy
- has_many :likes
- has_many :sns
- has_many :trading
- has_one :creditcards
- has_one :profile

## Profileテーブル
|Column|Type|Options|
|------|----|-------|
|body|text||
|first_name|string||
|last_name|string||
|first_name_kana|string||
|last_name_kana|string||
|birth_year|integer||
|birth_month|integer||
|birth_day|integer||
|phone_number|integer|unique: true|
|zipcode|integer||
|prefecture|integer||
|city|string||
|district|string||
|building|string||
|user_id|reference|null: false, index: true, foreign_key: true|

### Association
- belongs_to: user

## Productテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|description|text|null: false|
|state|integer|null: false|
|price|integer|null: false|
|trade_status|integer|null: false|
|shipping_id|reference|null: false, index: true, foreign_key: true|
|category_id|reference|null: false, index: true, foreign_key: true|
|brand_id|reference|index: true, foreign_key: true|
|size_id|reference|index: true, foreign_key: true|
|user_id|reference|null: false, index: true, foreign_key: true|

### Association
- belongs_to :shipping
- belongs_to :category
- belongs_to :brand
- belongs_to :size
- belongs_to :user
- has_many :images
- has_many :comments
- has_many :likes
- has_one :order

## snsテーブル
|Column|Type|Options|
|------|----|-------|
|token|text|null: false|
|uid|string|null: false, unique: true|
|provider|string|null: false|
|user_id|reference|null: false, index: true, foreign_key: true|

### Association
- belongs_to: user

## Creditcardテーブル
|Column|Type|Options|
|------|----|-------|
|year|integer|null: false|
|month|integer|null: false|
|security_code|integer|null: false|
|card_code|integer|null: false|
|user_id|reference|null: false, index: true, foreign_key: true|

### Association
- belongs_to: user

## Commentテーブル
|Column|Type|Options|
|------|----|-------|
|body|text|null: false|
|user_id|reference|null: false, index: true, foreign_key: true|
|product_id|reference|null: false, index: true, foreign_key: true|

### Association
- belongs_to: user
- belongs_to: product

## Likeテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, index: true, foreign_key: true|
|product_id|reference|null: false, index: true, foreign_key: true|

### Association
- belongs_to: user
- belongs_to: product

## Tradingテーブル
|Column|Type|Options|
|------|----|-------|
|seller_id|reference|null: false, index: true, foreign_key: true|
|buyer_id|reference|null: false, index: true, foreign_key: true|

### Association
- belongs_to :buyer_id, class_name: "User"
- belongs_to :seller_id, class_name: "User"
- has_many :orders
- has_many :reviews

## Reviewテーブル
|Column|Type|Options|
|------|----|-------|
|body|text||
|rating|integer|null: false|
|trading_id|reference|null: false, index: true, foreign_key: true|

### Association
- belongs_to :trading

## Orderテーブル
|Column|Type|Options|
|------|----|-------|
|status|integer|null: false|
|product_id|reference|null: false, index: true, foreign_key: true|
|trading_id|reference|null: false, index: true, foreign_key: true|

### Association
- belongs_to :product
- belongs_to :trading
