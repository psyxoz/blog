class PostsController < ApplicationController
  caches_page :index
  expose(:post, finder: :find_by_slug)
  expose(:posts) { Post.page(params[:page]) }
end
