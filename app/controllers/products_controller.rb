class ProductsController < ApplicationController
  before_action :set_destroy, only: [:index, :new, :show]

  def index
  end

  def new
  end

  def show

  end

  def set_destroy
    product = Products.find(params[:id])
    product.destroy if product.user_id == current_user.id
  end
  