class Customer::PostsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    post = post.new(post_params)
    post.save
    redirect_to '/top'
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  
  def post_params
    params.require(:post).permit(:image, :title, :body, :genre_id, :post_image)
  end
end