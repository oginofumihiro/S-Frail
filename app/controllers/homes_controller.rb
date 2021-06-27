class HomesController < ApplicationController
  before_action :set_q, only: %i[top about]

  def top
    @q = Customer.search(params[:q])
    @results = @q.result(distinct: true)
    @posts = Post.page(params[:page]).per(8).order(created_at: :desc)
  end

  def about; end

  def set_q
    @q = Post.ransack(params[:q])
  end
end
