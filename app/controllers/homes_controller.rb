class HomesController < ApplicationController
    def top
        @q = Customer.search(params[:q])
        @results = @q.result(distinct: true)
        @posts = Post.all.order(created_at: :desc)
    end

    def about
    end
end
