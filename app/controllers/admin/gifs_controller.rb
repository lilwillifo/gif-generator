class Admin::GifsController < ApplicationController

  def new
  end

  def create
    category = Category.find_or_create_by(name: params[:category])
    gif = category.gifs.new
    if gif.save
      flash[:notice] = "#{category.name} gif created!"
    else
      flash[:notice] = 'Uh oh... something happened. Try again!'
    end
    redirect_to gifs_path
  end
end
