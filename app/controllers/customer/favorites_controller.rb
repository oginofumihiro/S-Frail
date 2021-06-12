class Customer::FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    favorite = Favorite.new(post_id: params[:post_id], post_image_id: params[:post_image_id])
    favorite.save
  end

  def destroy
    @post = Post.find(params[:id])
    favorite = Favorite.find_by(post_id: params[:id], post_image_id: params[:post_image_id])
    favorite.destroy
  end
end
