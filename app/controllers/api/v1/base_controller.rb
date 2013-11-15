class Api::V1::BaseController < ActionController::Metal

  include ActionController::Helpers
  include ActionController::Redirecting
  include ActionController::Rendering
  include ActionController::Renderers::All
  include ActionController::ConditionalGet
  include ActionController::MimeResponds
  include ActionController::RequestForgeryProtection
  include AbstractController::Callbacks
  include ActionController::Instrumentation
  include ActionController::ParamsWrapper
  include Rails.application.routes.url_helpers

  append_view_path "#{Rails.root}/app/views/api/v1"

  protect_from_forgery

  protected

  def unprocessable_entity
    render json: {}, status: 422
  end
end
