class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :load_product, only: :create

  def create
    @comment = @product.comments.build comment_params
    if @comment.save
      flash[:success] = t "success_create"
    else
      flash[:danger] = t "error_create"
    end
    redirect_to @product
  end

  def destroy
    if @comment.destroy
      flash.now[:success] = t "success_delete"
    else
      flash.now[:danger] = t "error_delete"
    end
    respond_to do |format|
      format.json do
        render json: {flash: flash}
      end
    end
  end

  private
  def load_product
    @product = Product.find_by id: comment_params[:product_id]
    unless @product
      flash[:danger] = t "error"
      redirect_to :back
    end
  end

  def comment_params
    params.require(:comment).permit(:content, :product_id)
      .merge! user_id: current_user.id
  end
end
