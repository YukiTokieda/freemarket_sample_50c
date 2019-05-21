class ProductsController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :authenticate_user!, only: :new
  before_action :set_product, :set_user, :set_shipping, :set_brand

  def index
  end

  def show
    @users_products = Product.get_user_product(@product).limit(6)
  end

  def edit
    set_product
    @categories = Category.where(parent_id: 0)
    @states = State.all
  end

  def update
    set_product
    if @product.update(update_params)
      redirect_to controller: :root, action: :index
    else
      render :edit
    end
  end

  def new
  end

  def create
  end

  def search
  end

  def destroy
  end

  private

  def set_product
    @product = Product.find(params[:id])
    @category_grandchild = Category.find(@product.category_id)
    @category_child = @category_grandchild.parent
    @category_parent = @category_child.parent
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_shipping
    @shipping = Shipping.find(params[:id])
  end

  def set_brand
    @brand = Brand.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:id, :name, :price, :description)
  end

  def update_params
    params.require(:product).permit(:name, :description, :category_id, :state_id, :price,
      shipping_attributes:[:method, :prefecture_from, :period_before_shipping, :fee_burden, :_destroy, :id],
      images_attributes:[:name, :_destroy, :id])
  end
end
