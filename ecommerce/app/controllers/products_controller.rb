class ProductsController < ApplicationController
  load_and_authorize_resource

  def show
    if user_signed_in?
      @comment = Comment.new
    end
  end
end
