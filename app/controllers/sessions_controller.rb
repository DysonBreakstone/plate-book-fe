class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    google_id = auth_hash['uid']
    email = auth_hash['info']['email']
    token = auth_hash['credentials']['token']
    require 'pry'; binding.pry
    user = BackendService.register_user(google_id, email, token)
    #
    #   user = User.find_or_create_by(email: email)
    #   user.update(google_id: google_id, token: token)

    session[:user_id] = user.id
    redirect_to dashboard_path

    #In a different controller

    # def show
    #   @user = User.find_by(id: session[:user_id])
    # end
  end

    # private
    
    # def auth_hash
    #   request.env['omniauth.auth']
    # end

    # def user_params
    #   {google_id: auth_hash['uid'], 
    #     email: auth_hash['info']['email'], 
    #     token: auth_hash['credentials']['token']}
    # end
end