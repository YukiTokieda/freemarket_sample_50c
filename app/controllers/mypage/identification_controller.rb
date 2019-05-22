class Mypage::IdentificationController < ApplicationController
  before_action :authenticate_user!
  def edit
  end

  def update
    if current_user.profile.update(identification_params)
      redirect_to action: :edit
    else
      # TODO:更新失敗時の処理を記述
    end
  end

  private

  def identification_params
    params.require(:profile).permit(:zipcode, :prefecture, :city, :district, :building)
  end
end
