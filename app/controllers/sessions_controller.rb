class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    google_id = auth_hash['uid']
    email = auth_hash['info']['email']
    token = auth_hash['credentials']['token']
    
    user = BackendService.new.register_user(google_id, email, token)
    #
    #   user = User.find_or_create_by(email: email)
    #   user.update(google_id: google_id, token: token)

    user = JSON.parse(user.body, symbolize_names: true)[:data]
    session[:user_id] = user[:id].to_i
    redirect_to root_path
    
    #In a different controller

    # def show
    #   @user = User.find_by(id: session[:user_id])
    # end
  end

  def logout
    session.clear
  end

end