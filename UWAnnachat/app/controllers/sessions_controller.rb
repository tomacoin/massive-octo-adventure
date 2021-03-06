class SessionsController < ApplicationController
  
  skip_before_filter :authorize

  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to chatrooms_url
    else
	    redirect_to login_url, alert:"Incorrect username and password combination"
    end
  end

  def destroy
    User.find(session[:user_id]).update_attribute(:chatroom_id, nil)
  	session[:user_id] = nil
    redirect_to login_url, notice: "Logged out"
  end
end
