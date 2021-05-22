class Customer::PostsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
       redirect_to customer_posts_path
    else
       render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to customer_posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to customer_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:image, :name, :introduction, :genre_id, :post_image)
  end
end