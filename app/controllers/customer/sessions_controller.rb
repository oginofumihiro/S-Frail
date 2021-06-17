class Customer::SessionsController < Devise::SessionsController

  before_action :reject_inactive_customer, only: [:create]

  def reject_inactive_customer
    @customer = Customer.find_by(email: params[:customer][:email])
    if @customer
      if @customer.valid_password?(params[:customer][:password]) && !@customer.is_valid
        redirect_to new_customer_session
      end
    end
  end
end
