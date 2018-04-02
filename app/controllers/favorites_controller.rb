class FavoritesController < ApplicationController
  def create
    Favorite.create(gif_id: params[:gif_id], user_id: current_user.id)
    flash[:success] = 'Added to your favorite list!'
    redirect_to current_user
  end
end
