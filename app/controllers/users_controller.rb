class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to user
    else
      flash[:error] = 'Sorry, that username has been taken.'
      redirect_to new_user_path
    end
  end

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
