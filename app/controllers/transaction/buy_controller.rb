class Transaction::BuyController < ApplicationController
  before_action :authenticate_user!

  def show
    @product = Product.find(params[:id])
  end

  def create
    binding.pry
    @trading = Trading.create(buyer_id: current_user.id, seller_id: 3)
    @order = @trading.orders.create(status: 2, product_id: 1)

    redirect_to root_path
  end



end
