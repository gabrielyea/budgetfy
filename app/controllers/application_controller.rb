class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_groups_path(resource)
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |u|
      u.permit(:email, :password, :remeber_me)
    end

    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :current_password)
    end
  end
end
