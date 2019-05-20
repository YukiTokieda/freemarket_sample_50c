class ProductsController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :set_product, only: [:show, :destroy, :edit, :update]

  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def destroy
    @product.destroy if product.user_id == current_user.id
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

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :category_id, :state_id, :price,
      shipping_attributes:[:method, :prefecture_from, :period_before_shipping, :fee_burden, :_destroy, :id],
      images_attributes:[:name, :_destroy, :id])
  end
end
