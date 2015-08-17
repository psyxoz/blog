class Admin::PostsController < Admin::BaseController
  after_filter :cleanup_cached_pages, only: [:create, :update]

  expose(:post, finder: :find_by_slug, attributes: :post_params)
  expose(:posts) { Post.page(params[:page]) }

  def create
    if post.save
      flash[:notice] = 'Post created'
      redirect_to action: :index
    else
      render :new
    end
  end

  def update
    if post.save
      expire_fragment("post_#{post.id}_content")
      flash[:notice] = 'Post updated'
      redirect_to action: :index
    else
      render :edit
    end
  end

  def destroy
    post.destroy
    redirect_to action: :index
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

  def cleanup_cached_pages
    expire_page controller: 'posts', action: 'index'
  end
end
