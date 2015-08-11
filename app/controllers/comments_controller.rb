class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    comment = Comment.new(comment_params)
    comment.user = current_user

    if comment.save
      render json: { success: true }, status: :created
    else
      render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end