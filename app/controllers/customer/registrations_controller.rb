class Customer::RegistrationsController < Devise::RegistrationsController
  def new
    @customer = Customer.new
  end

end
