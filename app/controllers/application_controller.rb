class ApplicationController < ActionController::Base
  helper_method :current_user
  
  def current_user
    @_current_user ||= session[:user_id] if session[:user_id]
  end
end
