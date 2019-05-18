class ProductsController < ApplicationController
  def index
  end

  def new
  end

  def show
    # @product = Product.find(params[:id])
  end

  def destroy
    products = Products.find(params[:id])
      if products.user_id == current_user.id
        products.destroy
      end
  end
end