class Customer::PostCommentsController < ApplicationController
  def create
    @comment = current_customer.post_comments.new(comment_params)
    if @comment.save
      redirect_to customer_post_path(@comment.post_id)
    else
      render :show
    end
  end

  def destroy
  end

  private
  def comment_params
    params.require(:post_comment).permit(:comment, :customer_id, :post_id)
  end
end
