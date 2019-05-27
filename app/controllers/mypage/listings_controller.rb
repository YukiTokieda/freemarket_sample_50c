class Mypage::ListingsController < ApplicationController

  def listing
    @products = current_user.products.where(status_id: 1)
  end

  def in_progress
    @products = current_user.products.where(status_id: 2)
  end

  def completed
    @products = current_user.products.where(status_id: 3)
  end
end
