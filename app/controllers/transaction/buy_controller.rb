class Transaction::BuyController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product

  def show
  end

  def create
    @trading = Trading.create(buyer_id: current_user.id, seller_id: @product.id)
    @order = Order.create(trading_id: @trading.id, product_id: @product.id)
    @product.update(status_id: 2);
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

end
