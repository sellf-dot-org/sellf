class ApplicationController < ActionController::Base
  include ApplicationHelper

  protect_from_forgery with: :exception

  protected

  # A simple before_action to redirect a non-logged-in
  # user to the login page
  def require_user
    if session[:user_id].blank?
      redirect_to new_sessions_path
      return
    end
  end

  # A simple before_action to redirect a non-admin
  # user to the login page
  def require_admin
    if session[:user_id].blank?
      redirect_to new_sessions_path
      return
    elsif current_user.admin? == false
      redirect_to user_path(current_user)
      return
    end
  end
end
