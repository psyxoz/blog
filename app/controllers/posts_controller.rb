class PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page])
  end

  def show
    @post = Post.friendly.find(params[:id])
    @comments = @post.comments.page(params[:page])
  end
end
