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

  def meta_title
    if content_for(:title).present?
      "#{content_for(:title)} on palinium.com"
    else
      begin
        Blog::SeoData[controller_name][action_name]['meta_title']
      rescue ActionView::Template::Error
        ""
      end
    end
  end

  def meta_description
    if content_for(:meta_description).present?
      "#{content_for(:meta_description)} on palinium.com"
    else
      begin
        Blog::SeoData[controller_name][action_name]['meta_description']
      rescue ActionView::Template::Error
        ""
      end
    end
  end
end
