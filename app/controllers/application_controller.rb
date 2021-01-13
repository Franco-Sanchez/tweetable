class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :update_allowed_parameter, if: :devise_controller?

  protected

  def update_allowed_parameter
    authorized = proc do |user|
      user.permit(:email, :username,
                  :name, :avatar,
                  :password, :password_confirmation,
                  :current_password)
    end

    devise_parameter_sanitizer.permit(:sign_up, &authorized)
    devise_parameter_sanitizer.permit(:account_update, &authorized)
  end
end
