class Mypage::IdentificationController < ApplicationController
  before_action :authenticate_user!
  def edit
    set_identification
  end

  def update
    set_identification
    @identification.update(identification_params)
    redirect_to action: :edit
  end

  private

  def set_identification
    @identification = Profile.find_by(user_id: current_user.id)
  end

  def identification_params
    params.require(:profile).permit(:zipcode, :prefecture, :city, :district, :building)
  end
end
