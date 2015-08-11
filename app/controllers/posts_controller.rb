class PostsController < ApplicationController
  def index
    @posts = Post.page params[:page]
  end

  def show
    @post = Post.friendly.find(params[:id])
  end
end
