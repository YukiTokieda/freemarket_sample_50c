class ProductsController < ApplicationController
  def index
  end

  def new
  end

  def show

  end

  def destroy
    product = Products.find(params[:id])
    product.destroy if product.user_id == current_user.id
  end
end