class ProductsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_user, :set_category, :set_shipping

  before_action :authenticate_user!, except: :show
  def index
  end

  def show
    @product = Product.find(params[:id])
    @users_products = Product.get_user_product(@product).limit(6)
  end
 
  def new
  end

  def create
  end

  def edit
  end

  def search
  end

  def destroy
  end

  private
  def product_params
    params.require(:product).permit(:id, :name, :price, :description)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def set_shipping
    @shipping = Shipping.find(params[:id])
  def show
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

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def update_params
    params.require(:product).permit(:name, :description, :category_id, :state_id, :price,
      shipping_attributes:[:method, :prefecture_from, :period_before_shipping, :fee_burden, :_destroy, :id],
      images_attributes:[:name, :_destroy, :id])
  end
end
