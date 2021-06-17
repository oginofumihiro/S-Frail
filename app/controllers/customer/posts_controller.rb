class Customer::PostsController < ApplicationController
  before_action :authenticate_customer!
  before_action :baria_customer, only: %i[edit destroy update]
  before_action :set_q, only: %i[index new show create update edit destroy search]

  def index
    @posts = Post.all.order(created_at: :desc)
    @posts = Post.includes(:favorited_custmers).sort { |a, b| b.favorited_custmers.size <=> a.favorited_custmers.size }
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.post_comments.order(created_at: :desc)
    @comment = current_customer.post_comments.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.start_time = DateTime.now
    if @post.save
      flash[:success] = '投稿にに成功しました'
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
    flash[:danger] = '投稿を削除しました'
    redirect_to customer_posts_path
  end

  def search
    @results = @q.result
  end

  def ranking
    @posts = Post.includes(:favorited_custmers).sort { |a, b| b.favorited_custmers.size <=> a.favorited_custmers.size }
  end

  private

  def post_params
    params.require(:post).permit(:image, :name, :introduction, :genre_id, :post_image, :customer_id)
  end

  def set_q
    @q = Post.ransack(params[:q])
  end

  def baria_customer
    redirect_to top_path unless Post.find(params[:id]).customer_id == current_customer.id
  end
end
