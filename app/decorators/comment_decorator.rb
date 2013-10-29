class CommentDecorator < Draper::Decorator
  include ActionView::Helpers
  include Rails.application.routes.url_helpers

  delegate_all

  def avatar
    width = [*60..70].sample
    height = [*60..70].sample
    ["http://placedog.com/#{width}/#{height}", "http://placekitten.com/#{width}/#{height}"].sample
  end
end
