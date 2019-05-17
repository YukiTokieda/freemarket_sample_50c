class Product < ApplicationRecord
  has_many :images
  belongs_to :shipping
  belongs_to :size
  belongs_to :status
  belongs_to :state
  belongs_to :category
  belongs_to :user

  scope :get_category, -> (category_range) { self.where(category_id: category_range).limit(4) }
  scope :get_brand, -> (brand_name) { self.where(brand: brand_name).limit(4) }
end
