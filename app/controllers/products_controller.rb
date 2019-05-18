class ProductsController < ApplicationController
  before_action :set_user, :set_category, :set_shipping, :set_image

  def index
  end

  def show
    @product = Product.find(params[:id])
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
    @image1 = Image.find(1)
    @image2 = Image.find(2)
    @image3 = Image.find(3)
    @image4 = Image.find(4)
    @image5 = Image.find(5)
  end
end
