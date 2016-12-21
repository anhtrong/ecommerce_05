class Admin::ProductsController < ApplicationController
  before_action :load_categories, only: [:new, :create]

  def index
    @search = Product.search params[:q]
    @products = @search.result.page(params[:page]).per Settings.per_page
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t "success_create"
      redirect_to admin_products_path
    else
      render :new
    end
  end

  private
  def product_params
    params.require(:product)
      .permit :name, :price, :description, :image, :category_id
  end

  def load_categories
    @categories = Category.all
  end
end
