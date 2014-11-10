class CommentsController < ApplicationController
  expose(:comment) { Comment.find_by_id(params[:id]) }
  expose(:post)

  def destroy
    if comment && comment.delete && current_user
      message = "Successfully deleted comment!"
    else
      message = "Couldn't delete comment!"
    end

    redirect_to post_path(post), notice: message
  end
end
