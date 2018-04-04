class CategoriesController < ApplicationController
  before_action :require_admin, only: [:destroy]
  before_action :require_login, only: [:show]

  def show
    @category = Category.find(params[:id])
  end
  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to gifs_path
  end
end
