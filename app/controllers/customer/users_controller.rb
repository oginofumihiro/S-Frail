class Customer::UsersController < ApplicationController
  def show
     @customer = Customer.find(params[:id])
     @profile_images = @customer.profile_image
  end

  def set_user
    @user = User.find([:id])
  end

end
