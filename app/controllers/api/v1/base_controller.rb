class Api::V1::BaseController < ActionController::Metal

  include ActionController::Helpers
  include ActionController::Redirecting
  include ActionController::Rendering
  include ActionController::Renderers::All
  include ActionController::ConditionalGet # need this for responding to different types .json .xml etc...
  include ActionController::MimeResponds
  include ActionController::RequestForgeryProtection # need this if your using SSL
  include ActionController::ForceSSL
  include AbstractController::Callbacks # need this to build params
  include ActionController::Instrumentation # need this for wrap_parameters
  include ActionController::ParamsWrapper
  include Rails.application.routes.url_helpers # tell the controller where to look for templates

  append_view_path "#{Rails.root}/app/views/api/v1" # you need this to wrap the parameters correctly eg # { "person": { "name": "Zack", "email": "sakchai@artellectual.com", "twitter": "@artellectual" }}

  wrap_parameters format: [:json] # might not need this (depends on your client) rails bypasses automatically if client is not browser

  protect_from_forgery

  respond_to :json
end