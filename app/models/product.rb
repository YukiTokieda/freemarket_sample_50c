class Product < ApplicationRecord
  # アソシエーション
  has_many :images, dependent: :delete_all
  belongs_to :shipping, dependent: :delete
  belongs_to :size
  belongs_to :status
  belongs_to :state
  belongs_to :category
  belongs_to :user
  has_one :order

  # バリデーション
  validates :name, presence: true, length: { in: 1..75 }
  validates :description, presence: true, length: { in: 1..1000 }
  validates :category_id, presence: true
  validates :size_id, presence: true
  validates :state_id, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  # ネストフォーム
  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :shipping, allow_destroy: true

  # 最新のものから並び替える
  scope :recent, -> { order("updated_at DESC") }
  # 商品を出品した投稿者の他の商品を取得
  scope :get_user_product, -> (product) { where(user_id: product.user_id).recent }
  # 渡されたカテゴリーIDの持った商品を取得（範囲指定可能）
  scope :get_category_products, -> (category_id) { where(category_id: category_id).recent }

  # 渡されたカテゴリーを持った配列を範囲形式で返す
  # 例：レディース159~337のカテゴリー配列を「159..337」形式で返す
  def self.get_categories_id_range(categories)
    start_id = categories.first.id
    end_id = categories.last.id
    Range.new(categories.first.id, categories.last.id)
  end

  # レディースカテゴリーの商品取得
  def self.get_ladies
    categories = Category.find(1).grandchildren
    ladies = get_category_products(get_categories_id_range(categories)).recent
  end
  # メンズカテゴリーの商品取得
  def self.get_mens
    categories = Category.find(2).grandchildren
    ladies = get_category_products(get_categories_id_range(categories)).recent
  end
  # キッズカテゴリーの商品取得
  def self.get_kids
    categories = Category.find(3).grandchildren
    ladies = get_category_products(get_categories_id_range(categories)).recent
  end
  # 化粧品カテゴリーの商品取得
  def self.get_cosmetics
    categories = Category.find(7).grandchildren
    ladies = get_category_products(get_categories_id_range(categories)).recent
  end
  # シャネルブランドの商品取得
  def self.get_chanel
    chanel = Product.where(brand: 'シャネル').recent
  end
  # ルイ ヴィトンブランドの商品取得
  def self.get_loisvuitton
    loisvuitton = Product.where(brand: 'ルイ ヴィトン').recent
  end
  # シュプリームブランドの商品取得
  def self.get_supreme
    supreme = Product.where(brand: 'シュプリーム').recent
  end
  # ナイキブランドの商品取得
  def self.get_nike
    nike = Product.where(brand: 'ナイキ').recent
  end

end
