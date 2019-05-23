class Transaction::BuyController < ApplicationController
  before_action :authenticate_user!
  @@product
  def show
    @@product = Product.find(params[:id])
    @product = @@product
  end

  def create
    @trading = Trading.create(buyer_id: current_user.id, seller_id: @@product.user_id)
    @order = @trading.orders.create(status: 2, product_id: @@product.id)
    redirect_to root_path
  end



end
