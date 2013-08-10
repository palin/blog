class PostsController < ApplicationController
  require 'pagination'

  expose(:posts) { Post.visible.published }
  expose(:pgn) { Pagination.new(posts, 3, params) }
  expose(:posts_paginated) { posts.page(params[:page] || 1).per(params[:per_page] || 3) }
  expose(:decorated_posts) { PostDecorator.decorate_collection(posts_paginated) }
  expose(:post) { Post.find_by_slug(params[:id]).decorate }
  expose(:comment) { Comment.new }
  expose(:comments) { post.comments }

end
