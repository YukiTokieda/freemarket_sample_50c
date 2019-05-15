class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception


  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['TE50c'] && password == ENV['5050']
    end
  end
end

def after_sign_in_path_for(resource)
    root_path
end
