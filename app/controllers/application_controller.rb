class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_customer!


  def index
    @search = Customer.ransack(params[:q])
    @customers = @search.result
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[last_name first_name last_name_kana first_name_kana postal_code address telephone_number
                                               is_valid profile_image])
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      if customer_signed_in?
        sign_out(current_customer)
      end
      admin_customers_path
    when Customer
      if admin_signed_in?
        sign_out(current_admin)
      end
      customer_customer_path(current_customer)
    end
  end

  def after_sign_out_path_for(_resource)
    new_customer_session_path
  end

end
