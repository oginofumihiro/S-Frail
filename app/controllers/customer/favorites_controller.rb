class Customer::FavoritesController < ApplicationController
  def create
    favorite = Favorite.new(post_id: params[:post_id], post_image_id: params[:post_image_id])
    favorite.save
    redirect_to customer_post_path(params[:post_id])
  end

  def destroy
    # @post = Post.find(params[:post_id])
    favorite = Favorite.find_by(post_id: params[:post_id], post_image_id: params[:post_image_id])
    favorite.destroy
    redirect_to customer_post_path(params[:post_id])
  end

  # def favorite_params
  #   params.require(:favorite).permit(:post_id, :post_image_id)
  # end
end
