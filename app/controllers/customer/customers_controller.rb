class Customer::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = Customer.find(params[:id])
    @relationship_followings = Relationship.where(customer_id: @customer.id)
    @followings = []
    @relationship_followings.each do |following|
      customer = Customer.find(following.follow_id)
      @followings.push(customer)
    end
    @posts = @customer.posts
    @profile_images = @customer.profile_image
    @post = Post.where(customer_id: params[:id]).last
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    flash[:success] = '登録情報を変更しました'
    redirect_to customer_customer_path(@customer.id)
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    flash[:notice] = 'ありがとうございました。またのご利用を心よりお待ちしております。'
    redirect_to new_customer_registration_path
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_valid: false)
    reset_session
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code,
                                     :address, :telephone_number, :profile_image)
  end
end
