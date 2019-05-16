class Mypage::IdentificationController < ApplicationController
  before_action :authenticate_user!
  def edit
  end
end
