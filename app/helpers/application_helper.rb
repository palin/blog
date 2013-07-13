module ApplicationHelper

  def pagination(data)
    render partial: "partials/pagination", locals: { pgn: data }
  end
end
