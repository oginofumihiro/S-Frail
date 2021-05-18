class ApplicationController < ActionController::Base
    before_action :authenticate_customer!,except: [:top]
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_valid,:email, :password, :profile_image])
  end

  def after_sign_in_path_for(resource)
     customer_user_path(current_customer)
  end

end
