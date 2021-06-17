class Customer::FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    favorite = Favorite.new(post_id: @post.id, customer_id: current_customer.id)
    favorite.save
  end

  def destroy
    @post = Post.find(params[:id])
    favorite = Favorite.find_by(post_id: @post.id, customer_id: current_customer.id)
    favorite.destroy
  end

  def index
    @customer = Customer.find(params[:customer_id])
    @favorites = @customer.favorites
  end
end
