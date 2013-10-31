class CommentDecorator < Draper::Decorator
  include ActionView::Helpers
  include Rails.application.routes.url_helpers

  delegate_all

end
