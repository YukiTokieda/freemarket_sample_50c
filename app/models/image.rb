class Image < ApplicationRecord
  belongs_to :product
  mount_uploader :name, ImageUploader
end
