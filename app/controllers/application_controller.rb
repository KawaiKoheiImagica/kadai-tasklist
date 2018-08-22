class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
  private
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def idid
    if session[:user_id]==session[:id]
      redirect_to login_url
    end
  end

end
