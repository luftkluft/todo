class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def default_url_options
    begin
      user = User.find(current_user.id)
      {locale: user.locale}
    rescue
      {locale: 'en'}
    end
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name])
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:username, :email)
    end
  end
end
