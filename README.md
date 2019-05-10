# DB設計


## Userテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|telephone|integer|null: false, unique: true|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_ka|string|null: false|
|last_name_ka|string|null: false|
|birth_ymd|datetime|null: false|

### Association
- has_many :comments, dependent: :destroy
- has_many :products, dependent: :destroy
- has_many :likes, dependent: :destroy


## Commentテーブル

|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product


## Productテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|description|text|null: false|
|state|string|null: false|
|price|integer|null: false|
|saler_id|integer|null: false, foreign_key: true|
|buyer_id|integer|null: false, foreign_key: true|
|shipping_id|indeger|null: false, foreign_key: true|
|category_id|indeger|null: false, foreign_key: true|
|brand_id|indeger|foreign_key: true|
|status|integer|null: false, default: 1|

### Association
- belongs_to :buyer, class_name: user
- belongs_to :saler, class_name: user
- belongs_to :brand
- belongs_to :shipping, dependent: :destroy
- has_many :comments, dependent: :destroy
- belogns_to :category
- has_many :likes, dependent: :destroy


## Categoryテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|numb|string|null: false|
|numb_path|string|null: false, index: true|

### Association
- has_many :products


## Brandテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- belongs_to :product


## Shippingテーブル

|Column|Type|Options|
|------|----|-------|
|method|string|null: false|
|region|integer|null: false|
|period|string|null: false|
|pay_shipping|string|null: false|

### Association
- belongs_to :product


## Likeテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|product_id|integer|null: false|

### Association
- belongs_to :user
- belongs_to :product
- validates :user_id, presence: true
- validates :micropost_id, presence: true
