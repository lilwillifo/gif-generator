class CategoriesController < ApplicationController
  before_action :require_admin

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to gifs_path
  end
end
