class UserSessionsController < ApplicationController
  expose(:user_session) { UserSession.new(params[:user_session]) || UserSession.new }

  def create
    if user_session.save
      redirect_to admin_posts_url
    else
      render :new
    end
  end

  def destroy
    current_user_session.destroy if current_user_session.present?
    redirect_to root_url
  end
end
