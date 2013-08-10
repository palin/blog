class PostDecorator < Draper::Decorator
  include ActionView::Helpers
  include Rails.application.routes.url_helpers

  delegate_all

  def abstract
    separator = "<!--MORE-->"
    truncate(content,
      :length => 0,
      :separator => separator,
      :omission => link_to(button_tag("READ MORE", class: 'omission btn btn-block btn-info'), post_path(self), class: 'omission')
    )
  end

  def content_or_abstract(action)
    action == "show" ? content : abstract
  end

  def tag_collection
    self.tag_list.join(", ") if self.tag_list.present?
  end
end
