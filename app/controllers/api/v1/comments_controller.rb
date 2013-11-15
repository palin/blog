class Api::V1::CommentsController < Api::V1::BaseController
  respond_to :json

  before_filter :setup_negative_captcha, only: [:create, :update]
  before_filter :find_post

  def create
    @comment = @post.comments.build(@captcha.values)

    if @captcha.valid? && @comment.save
      respond_with @comment
    else
      unprocessable_entity
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
    @post = if params[:comment]
      Post.find_by_slug(params[:comment][:post_id])
    else
      Post.find(params[:post_id])
    end
  end
end
