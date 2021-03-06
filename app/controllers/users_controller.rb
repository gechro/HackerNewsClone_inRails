class UsersController < ApplicationController
  def new
    if session[:user_id]
      redirect_to user_path(@current_user)
    else
      @user = User.new
      redirect_to login_path
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:errors] = user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    @user_posts = @user.posts
  end

  def submissions
    @submissions = User.find_by(id: params[:id]).posts
  end

  def comments
    @comments = User.find_by(id: params[:id]).comments
  end

  def edit
    #edit password
  end

  def update
    #update attributes :password and :karma
  end

  def destroy
    #delete account and log out
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :karma)
  end
end
