class Mypage::IdentificationController < ApplicationController
  before_action :authenticate_user!
  def edit
    @profile = Profile.find_by(user_id: current_user.id)
  end
end
