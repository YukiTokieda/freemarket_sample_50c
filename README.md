
# README


## Userテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|unique: true|
|telephone|integer|null: false|unique: true|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_ka|string|null: false|
|last_name_ka|string|null: false|
|birth_ymd|string|null: false|

### Association
- has_many :comments
- has_many :products


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
|user_id|integer|foreign_key: true|
|brand_id|integer|foreign_key: true|
|status_id|indeger|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :brand
- belongs_to :status
- belongs_to :shipping
- has_many :comments
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


## Statusテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|product_id|integer|foreign_key: true|

### Association
- belongs_to :product


## Shippingテーブル

|Column|Type|Options|
|------|----|-------|
|method|string|null: false|
|region|integer|null: false|
|period|integer|null: false|

### Association
- belongs_to :product
