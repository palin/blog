class CommentsController < ApplicationController
  expose(:comment)
  expose(:post) { Post.find_by_slug(params[:comment][:post_id]) }

  def create
    comment = post.comments.build(params[:comment])
    if comment.save
      redirect_to post_path(:id => params[:comment][:post_id])
    else
      render 'posts/show'
    end
  end

  def update

  end
end
