class FavoritesController < ApplicationController
  before_action :require_login

  def create
    Favorite.create(gif_id: params[:gif_id], user_id: current_user.id)
    flash[:success] = 'Added to your favorite list!'
    redirect_to current_user
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy
    redirect_to user_path(current_user)
  end
end
