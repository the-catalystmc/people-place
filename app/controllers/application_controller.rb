class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, unless: :json_request
  before_action :authenticate_user!, :update_allowed_parameters, if: :devise_controller?

  include Response
  include ExceptionHandler
  
  protected
  
  def json_request
      request.format.json?
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :bio, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :bio, :email, :password, :current_password)
    end
  end
end
