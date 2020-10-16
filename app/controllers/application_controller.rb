class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def default_url_options
    user = User.find(current_user.id)
    { locale: user.locale }
  rescue StandardError
    { locale: 'en' }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username first_name last_name role])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username first_name last_name])
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:username, :email)
    end
  end
end
