class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday])
  end

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username,password|
      username == 'admin' && password == '5555'  
  
    end
  end
end
