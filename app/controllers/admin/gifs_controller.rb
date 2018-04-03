class Admin::GifsController < ApplicationController
  before_action :require_admin

  def new
  end

  def index
  end

  def create
    category = Category.find_or_create_by(name: params[:category])
    gif = CreateGif.call(category)
    if gif.save
      flash[:notice] = "#{category.name} gif created!"
    else
      flash[:notice] = 'Uh oh... something happened. Try again!'
    end
    redirect_to gifs_path
  end

  private

  def require_admin
    render file: "/public/404" unless current_admin?
  end
end
