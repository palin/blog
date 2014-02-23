class PostsController < ApplicationController
  require 'pagination'

  expose(:posts) { filter_posts }
  expose(:pgn) { Pagination.new(posts, 10, params) }
  expose(:posts_paginated) { posts.page(params[:page] || 1).per(params[:per_page] || 10) }
  expose(:decorated_posts) { PostDecorator.decorate_collection(posts_paginated) }
  expose(:post) { Post.find_by_slug(params[:id]).decorate }
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

  def filter_posts
    if params[:filter].present?
      Post.visible.published.filter(params[:filter])
    else
      Post.visible.published
    end
  end
end
