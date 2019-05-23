class Transaction::BuyController < ApplicationController
  before_action :authenticate_user!

  def show
    @product = Product.find(params[:id])
  end

  def create

    @trading = Trading.create(buyer_id: 1,seller_id: 2)
    @order = Order.create(status: 2,product_id: 1,trading_id: 1)
    redirect_to controller: :root, action: :index
  end

end
