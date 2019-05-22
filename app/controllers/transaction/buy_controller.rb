class Transaction::BuyController < ApplicationController
  before_action :authenticate_user!

  def new
    @product = Product.find(params[:id])
  end

end
