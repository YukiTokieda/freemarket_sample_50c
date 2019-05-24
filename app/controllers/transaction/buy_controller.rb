class Transaction::BuyController < ApplicationController
  before_action :authenticate_user!
  @@product
  def show
    @@product = Product.find(params[:id])
    @product = @@product
  end

  def create
    binding.pry
    @trading = Trading.create(buyer_id: current_user.id, seller_id: @@product.user_id)
    @order = @trading.orders.create(product_id: @@product.id)
    redirect_to root_path
  end
end
