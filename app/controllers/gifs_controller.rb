class GifsController < ApplicationController
  def index
    @categories = Category.all
  end

  def update
    fav = Favorite.find_by(gif_id: params[:id], user_id: current_user.id)
    fav.destroy
    flash[:success] = 'Removed from your favorite list!'
    redirect_to user_path(current_user)
  end
end
