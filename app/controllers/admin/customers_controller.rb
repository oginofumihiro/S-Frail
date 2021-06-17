class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.all
    @customers = Customer.all.page(params[:page]).per(10)
  end

  private

  def customers_params
    params.require(:customer).permit(:first_name, :last_name, :postal_code, :residence, :phone_number, :email, :is_valid,
                                     :page)
  end
end
