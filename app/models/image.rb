class Image < ApplicationRecord
  # アソシエーション
  belongs_to :product ,optional: true

  #バリデーション
  validates :name, presence: true
  
  # 画像アップローダー
  mount_uploader :name, ImageUploader
end
