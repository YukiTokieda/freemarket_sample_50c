class Mypage::ProfilesController < ApplicationController
  before_action :authenticate_user!
  def edit
    set_profile
  end

  def update
    set_profile
    @profile.update(profile_params)
    redirect_to action: :edit
  end

  private

  def set_profile
    @profile = Profile.find_by(user_id: current_user.id)
  end

  def profile_params
    params.require(:profile).permit(:body)
  end

end
