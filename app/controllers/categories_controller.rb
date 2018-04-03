class CategoriesController < ApplicationController
  before_action :require_admin

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to current_user
  end

  private

  def require_admin
    render file: "/public/404" unless current_admin?
  end
end
