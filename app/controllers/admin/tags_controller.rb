class Admin::TagsController < Admin::AdminController

  expose(:tags)

  def update
    if tag.save
      redirect_to admin_tags_path, notice: "Successfully updated tag!"
    else
      render :edit
    end
  end

  def destroy
    if tag && tag.delete
      message = "Successfully deleted tag!"
    else
      message = "Couldn't delete tag!"
    end

    redirect_to admin_tags_path, notice: message
  end
end
