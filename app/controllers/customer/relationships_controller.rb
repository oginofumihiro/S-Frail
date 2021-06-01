class Customer::RelationshipsController < ApplicationController
  before_action :set_customer

  def create
    following = current_customer.follow(@customer)
    if following.save
      flash[:success] = 'ユーザーをフォローしました'
      #render :show
      redirect_to customer_post_path(params[:post_id])
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_to customer_post_path(params[:post_id])
    end
  end

  def destroy
    following = current_customer.unfollow(@customer)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_to customer_post_path(params[:post_id])
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to customer_post_path(params[:post_id])
    end
  end

  private
  def relationship_params
    params.require(:relationship).permit(:follow_id)
  end

  def set_customer
   @customer = Customer.find(params[:follow_id])
  end
end