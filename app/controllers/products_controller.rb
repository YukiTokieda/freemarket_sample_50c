class ProductsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_user, :set_category, :set_shipping

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
  end
end
