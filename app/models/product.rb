class Product < ApplicationRecord
  has_many :images
  belongs_to :shipping
  belongs_to :size
  belongs_to :status
  belongs_to :state
  belongs_to :category
  belongs_to :user
end
