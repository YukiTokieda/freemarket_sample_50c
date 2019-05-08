# DB設計

## Userテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|telephone|integer|null: false, unique: true|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_ka|string|null: false|
|last_name_ka|string|null: false|
|birth_ymd|date|null: false|

### Association
- has_many :comments, dependent: :destroy
- has_many :products, dependent: :destroy


## Commentテーブル

|Column|Type|Options|
|------|----|-------|
|text|string|
|user_id|integer|foreign_key: true|
|product_id|integer|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product


## Productテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|index: true|
|image|string|null: false|
|price|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
|brand_id|integer|foreign_key: true|
|state_id|indeger|null: false, foreign_key: true|
|shipping_id|indeger|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :brand
- belongs_to :state
- belongs_to :shipping, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :categories, through: :products_categories


## Product_categoryテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|foreign_key: true|
|category_id|integer|foreign_key: true|

### Association
- belongs_to :product
- belongs_to :category


## Categoryテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :types
- has_many :products, through: :products_categories


## Typeテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|category_id|indeger|foreign_key: true|

### Association
- belongs :category
- has_many :details


##  Detailテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|type_id|integer|foreign_key: true|

### Association
- belongs_to :type


## Brandテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- belongs_to :product


## Stateテーブル

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

### Association
- belongs_to :product
