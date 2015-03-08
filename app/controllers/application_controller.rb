class ApplicationController < ActionController::Base
  protect_from_forgery

  respond_to :json

  helper_method :current_user_session, :current_user

  before_filter :prepare_gon_variables

  def prepare_gon_variables
    gon.trackers = Blog::Trackers
    gon.domains = Blog::Domains
  end

  protected

  def access_forbidden
    render(nothing: true, status: 403) and return
  end

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end
end
