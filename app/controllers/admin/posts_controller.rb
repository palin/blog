class Admin::PostsController < Admin::AdminController

  expose(:posts)
  expose(:post, finder: :find_by_slug)

  def update
    if post.save
      redirect_to admin_posts_path, :notice => "Successfully updated post!"
    else
      render :edit
    end
  end

  def create
    if post.save
      redirect_to admin_posts_path, :notice => "Successfully saved post!"
    else
      render :new
    end
  end

  def destroy
    if post && post.delete
      message = "Successfully deleted post!"
    else
      message = "Couldn't delete post!"
    end

    redirect_to admin_posts_path, :notice => message
  end

  def publish
    post.publish!
    redirect_to admin_posts_path, :notice => "Successfully updated post!"
  end

  def hide
    post.hide!
    redirect_to admin_posts_path, :notice => "Successfully updated post!"
  end

  def visible
    post.visible!
    redirect_to admin_posts_path, :notice => "Successfully updated post!"
  end
end
