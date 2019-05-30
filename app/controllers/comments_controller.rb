class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    comment = current_user.comments.new(product_params)
    if comment.save
      redirect_to :back
    end
  end

  private

  def product_params
    params.require(:comment).permit(:body, :product_id)
  end
end
