module ApplicationHelper

  def pagination(data)
    render partial: "partials/pagination", locals: { pgn: data }
  end

  def backbone_view
    if controller_name == "posts"
      if action_name == "index"
        "Posts"
      elsif action_name == "show"
        "Post"
      end
    else
      controller_name.humanize
    end
  end
end
