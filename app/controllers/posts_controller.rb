class PostsController < ApplicationController
  def index  # indexアクションを定義した
    @posts = Post.all.order(id: "DESC")  # 1番目のレコードを@postに代入
  end

  def create
    post = Post.create(content: params[:content], checked: false)
    render json:{ post: post }
  end

  def checked
    binding.pry
    post = Post.find(params[:id])
    if post.checked
      post.update(checked: false)
    else
      post.update(checkde: true)
    end

    item = Post.find(params[:id])
    render json:{ post: item }
  end
end
