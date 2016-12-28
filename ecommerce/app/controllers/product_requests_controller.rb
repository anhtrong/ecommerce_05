class ProductRequestsController < ApplicationController
  load_and_authorize_resource
  before_action :load_categories, except: [:index, :destroy]

  def new
    @product_request = ProductRequest.new
  end

  def show
  end

  def create
    @product_request = ProductRequest.new product_request_params
    if @product_request.save
      flash[:success] = t "success_create"
      redirect_to product_request_path @product_request
    else
      render :new
    end
  end

  private
  def product_request_params
    params.require(:product_request)
      .permit(:product_name, :description, :image, :category_id)
      .merge! user: current_user
  end

  def load_categories
    @categories = Category.order_name
  end
end
