class CommentsController < ApplicationController
  before_filter :authorization_check

  expose(:comment) { Comment.find_by_id(params[:id]) }
  expose(:post)

  def destroy
    message = if comment && comment.delete
                'Successfully deleted comment!'
              else
                "Couldn't delete comment!"
              end

    redirect_to post_path(post), notice: message
  end

  private

  def authorization_check
    access_forbidden unless current_user.present?
  end
end
