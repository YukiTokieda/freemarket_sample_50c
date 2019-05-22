class Transaction::BuyController < ApplicationController
  before_action :authenticate_user!

  def show
    @product = Product.find(params[:id])
  end

end
