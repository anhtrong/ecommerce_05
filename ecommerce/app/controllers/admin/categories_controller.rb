class Admin::CategoriesController < ApplicationController
  def index
    @search = Category.search params[:q]
    @categories = @search.result.page(params[:page]).per Settings.per_page
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "success_create"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  private
  def category_params
    params.require(:category).permit :name
  end
end
