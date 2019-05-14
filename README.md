# DB設計

## Userテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_many :comments
- has_many :products, dependent: :destroy
- has_many :likes
- has_many :sns
- has_many :trading
- has_one :creditcard
- has_one :profile, dependent: :destroy

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
|brand|string||
|trade_status|integer|null: false|
|shipping_id|reference|null: false, index: true, foreign_key: true|
|category_id|reference|null: false, index: true, foreign_key: true|
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
- has_one :shipping

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

## Shippingテーブル
|Column|Type|Options|
|------|----|-------|
|method|integer|null: false|
|prefecture_from|integer|null: false|
|period_before_shipping|integer|null: false|
|fee|integer|null: false|

### Association
- belongs_to :product

## Categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|parent_id|refarence|index: true, foreign_key: true|

### Association
- belongs_to :parent, class_name: "Category"
- has_many :products
- has_many :childs, class_name: "Category", foreign_key: "parent_id"
- has_many :brand_category
- has_many :size_category

## Brand_categoryテーブル
|Column|Type|Options|
|------|----|-------|
|brand_id|reference|null: false, index: true, foreign_key: true|
|category_id|reference|null: false, index: true, foreign_key: true|

### Association
- belogns_to :category
- belongs_to :brand

## Size_categoryテーブル
|Column|Type|Options|
|------|----|-------|
|size_id|reference|null: false, index: true, foreign_key: true|
|category_id|reference|null: false, index: true, foreign_key: true|

### Association
- belogns_to :category
- belongs_to :size

## Brandテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- belogns_to :category
- belongs_to :brand

## Sizeテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- belogns_to :category
- belongs_to :size

## Imageテーブル
|Column|Type|Options|
|------|----|-------|
|url|string|null: false|
|product_id|reference|null: false, index: true, foreign_key: true|

### Association
- belongs_to :product
