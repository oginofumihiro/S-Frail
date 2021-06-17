class Customer::RelationshipsController < ApplicationController
  before_action :set_customer, only: %i[create destroy]

  def create
    @post = Post.find(params[:post_id])
    following = current_customer.follow(@customer)
    following.save
    flash[:success] = 'ユーザーをフォローしました'
  end

  def destroy
    @post = Post.find(params[:post_id])
    following = current_customer.unfollow(@customer)
    following.destroy
    flash[:success] = 'ユーザーのフォローを解除しました'
  end

  def follower
    @followers = current_customer.reverse_of_relationships
  end

  def following
    @followings = current_customer.relationships
  end

  private

  def relationship_params
    params.require(:relationship).permit(:follow_id)
  end

  def set_customer
    @customer = Customer.find(params[:follow_id])
  end
end
