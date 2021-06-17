class Customer::PostCommentsController < ApplicationController
  before_action :authenticate_customer!

  def create
    @post = Post.find(params[:post_comment][:post_id])
    @comment = current_customer.post_comments.build(comment_params)
    if @comment.save
    else
      # render :show
    end
  end

  def destroy
    @comment = PostComment.find(params[:id])
    if @comment.destroy
      @post = @comment.post

      flash[:danger] = 'コメントを削除しました'
      # redirect_to customer_post_path(@comment.post_id)
    else
      # render :show
    end
  end

  private

  def comment_params
    params.require(:post_comment).permit(:comment, :customer_id, :post_id)
  end
end
