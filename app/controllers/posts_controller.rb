class PostsController < ApplicationController
  expose(:decorated_posts) { PostDecorator.decorate_collection(Post.visible.published) }
  expose(:post) { Post.find_by_slug(params[:id]).decorate }
end
