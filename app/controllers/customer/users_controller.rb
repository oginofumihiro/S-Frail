class Customer::UsersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @profile_images = @customer.profile_image
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_user_path(@customer_user.id)
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :profile_image)
  end


  # def set_user
  #   @user = User.find([:id])
  # end

end
