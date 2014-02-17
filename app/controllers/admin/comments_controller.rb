class Admin::CommentsController < Admin::AdminController

  expose(:comments)
  expose(:comment)

  def update
    if comment.save
      redirect_to admin_comments_path, notice: "Successfully updated comment!"
    else
      render :edit
    end
  end

  def destroy
    if comment && comment.delete
      message = "Successfully deleted comment!"
    else
      message = "Couldn't delete comment!"
    end

    redirect_to admin_comments_path, notice: message
  end
end
