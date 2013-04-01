class Admin::AdminController < ApplicationController
  layout "admin"

  before_filter :require_admin, :set_cache_buster

  protect_from_forgery

  def require_admin
    redirect_to login_url and return unless current_user.present?
  end

  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
end
