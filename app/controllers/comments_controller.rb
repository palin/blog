class CommentsController < ActionController::Base

  expose(:comment)
  expose(:post)

  def destroy
    if comment && comment.delete
      message = "Successfully deleted comment!"
    else
      message = "Couldn't delete comment!"
    end

    redirect_to post_path(post), :notice => message
  end
end
