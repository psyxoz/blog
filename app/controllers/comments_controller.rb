class CommentsController < ApplicationController
  before_filter :authenticate_user!
  expose(:post, finder: :find_by_slug, finder_parameter: :post_id)

  def create
    comment = post.comments.new(comment_params)
    comment.user = current_user

    if comment.save
      expire_fragment("post_#{comment.post_id}_comments")
      render json: { content: comment.content }, status: :created
    else
      render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end