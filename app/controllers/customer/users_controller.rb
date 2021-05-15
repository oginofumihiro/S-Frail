class Customer::UsersController < ApplicationController
  def show
     @customer = Customer.find(params[:id])
    # @post_images = @user.post_images.page(params[:page]).reverse_order
  end
  
  def set_user
    @user = User.find([:id])
  end
  
end
