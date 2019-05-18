class ProductsController < ApplicationController
  def index
  end

  def new
  end

  def show

  end

  def destroy
    product = Products.find(params[:id])
      if product.user_id == current_user.id
        product.destroy
      end
  end
end