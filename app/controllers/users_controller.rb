class UsersController < ApplicationController
  before_action :require_login, only: [:show]
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user
    else
      flash[:error] = 'Sorry, that username has been taken.'
      redirect_to new_user_path
    end
  end

  def show
    @categories = current_user.categories.order(:name).uniq
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
