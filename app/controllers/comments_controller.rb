class CommentsController < ApplicationController
  before_filter :setup_negative_captcha, :only => [:create, :update]

  expose(:comment)
  expose(:post) { find_post }

  def create
    comment = post.comments.build(@captcha.values)

    if @captcha.valid? && comment.save
      redirect_to post_path(post), notice: "Thank you!"
    else
      redirect_to post_path(post), alert: "There was a problem. Try again!"
    end

  end

  def update

  end

  def destroy
    if comment.delete
      redirect_to post_path(post), notice: "Comment has been deleted!"
    else
      redirect_to post_path(post), alert: "Comment has not been deleted!"
    end
  end

private
  def setup_negative_captcha
    @captcha = NegativeCaptcha.new(
      secret: ENV['NEGATIVE_CAPTCHA_SECRET'],
      spinner: request.remote_ip,
      fields: [:author, :content],
      params: params
    )
  end

  def find_post
    if params[:comment]
      Post.find_by_slug(params[:comment][:post_id])
    else
      Post.find(params[:post_id])
    end
  end
end
