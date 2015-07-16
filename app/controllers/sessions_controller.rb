class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to user_path(@current_user)
    end
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:user][:username])
    if user
      if user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        flash[:errors] = "Invalid username and password combination."
        redirect_to login_path
      end
    else
      flash[:errors] = "Username does not exist."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
