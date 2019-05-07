# README


## userテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false,|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_ka|string|null: false|
|last_name_ka|string|null: false|
|birth_ymd|string|null: false|

### Association
- has_many :comments
- has_many :products


## commentテーブル

|Column|Type|Options|
|------|----|-------|
|text|string|
|user_id|integer|foreign_key: true|
|product_id|integer|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product


## productテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|image|string|null: false|
|price|integer|null: false|
|region|string|null: false|
|shipping_date|string|null: false|
|user_id|integer|foreign_key: true|
|brand_id|integer|foreign_key: true|
|status_id|indeger|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :brand
- belongs_to :status
- has_many :comments
- has_many :categories, through: :products_categories

#### Options
- user_id index: true


## statusテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|

### Association
- belongs_to :product


## product_category

|Column|Type|Options|
|------|----|-------|
|product_id|integer|foreign_key: true|
|category_id|integer|foreign_key: true|

### Association
- belongs_to :product
- belongs_to :category


## category

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :products, through: :products_categories


## brand

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- belongs_to :product
