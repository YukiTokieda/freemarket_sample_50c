class ProductsController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :set_product, :set_shipping, :set_brand, except: [:new, :create]

  def index
  end

  def new
    @product = Product.new
    @shipping =  Shipping.new
    @categories = Category.where(parent_id: 0)
    @states = State.all
  end

  def create
    if current_user.products.create(product_params)
      redirect_to controller: :root, action: :index
    else
      # TODO:削除失敗の処理を記述する
    end
  end

  def show
    @user = User.find(@product.user_id)
    @users_products = Product.get_user_product(@product).limit(6)
  end

  def destroy
    if @product.destroy
      redirect_to controller: :root, action: :index
    else
      # TODO:削除失敗の処理を記述する
    end
  end

  def edit
    @categories = Category.where(parent_id: 0)
    @states = State.all
  end

  def update
    if @product.update(product_params)
      redirect_to controller: :root, action: :index
    else
      render :edit
    end
  end

  def search
  end

  private

  def set_product
    @product = Product.find(params[:id])
    @category_grandchild = Category.find(@product.category_id)
    @category_child = @category_grandchild.parent
    @category_parent = @category_child.parent
  end

  def set_shipping
    @shipping = Shipping.find(params[:id])
  end

  def set_brand
    @brand = Brand.find(params[:id])
  end

  def product_params
    params.require(:product).permit(
      :name, :description, :category_id, :brand, :size_id, :state_id, :price,
      shipping_attributes:[:method, :prefecture_from, :period_before_shipping, :fee_burden, :_destroy, :id],
      images_attributes:[:name, :_destroy, :id]
    )
  end
end
