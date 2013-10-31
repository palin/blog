class PostsController < ApplicationController
  require 'pagination'

  expose(:posts) { Post.visible.published }
  expose(:pgn) { Pagination.new(posts, 3, params) }
  expose(:posts_paginated) { posts.page(params[:page] || 1).per(params[:per_page] || 3) }
  expose(:decorated_posts) { PostDecorator.decorate_collection(posts_paginated) }
  expose(:raw_post) { Post.find_by_slug(params[:id])}
  expose(:post) { raw_post.decorate }
  expose(:comment) { Comment.new }
  expose(:comments) { post.comments }
  expose(:captcha) { setup_negative_captcha }

  def show
    gon.post_id = params[:id]
  end

  private

  def setup_negative_captcha
    NegativeCaptcha.new(
      secret: ENV['NEGATIVE_CAPTCHA_SECRET'],
      spinner: request.remote_ip,
      fields: [:author, :content],
      params: params
    )
  end
end
