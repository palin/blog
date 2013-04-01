class PostDecorator < Draper::Decorator
  include ActionView::Helpers
  include Rails.application.routes.url_helpers

  delegate_all

  def abstract
    separator = "<!--MORE-->"
    truncate(content,
      :length => 0,
      :separator => separator,
      :omission => link_to("...read more", post_path(self))
    )
  end

  def content_or_abstract(action)
    action == "show" ? content : abstract
  end

  def tag_list
    # self.tags.join(", ") if self.tags.present?
    "vodka, troll, mysql, database, rails, ror, gin"
  end
end
