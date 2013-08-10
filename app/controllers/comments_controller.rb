class CommentsController < ApplicationController
  expose(:comment)
  expose(:post) { Post.find_by_slug(params[:comment][:post_id]) }

  def create
    comment = post.comments.build(params[:comment])
    post_id = params[:comment][:post_id]
    if comment.save
      redirect_to post_path(id: post_id), notice: "Thank you!"
    else
      redirect_to post_path(id: post_id), alert: "There was a problem. Try again!"
    end

  end

  def update

  end
end
