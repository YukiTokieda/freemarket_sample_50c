class ProductsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_user, :set_category, :set_shipping, :set_image

  def index
  end

  def show
    @product = Product.find(params[:id])
    @product_ another = Product.where.not(id: ).where(id: )
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

  def set_image
    @image = Image.find(params[:id])
  end
end
