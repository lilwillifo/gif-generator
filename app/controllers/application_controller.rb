class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :current_admin?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  private

  def require_login
    redirect_to '/' unless current_user
  end

  def require_admin
    render file: "/public/404" unless current_admin?
  end
end
