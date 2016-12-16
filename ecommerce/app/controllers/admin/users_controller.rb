class Admin::UsersController < ApplicationController
  before_action :load_user, only: :show

  def index
    @users = User.paginate page: params[:page], Settings.per_page
  end

  def destroy
    if user_load.destroy
      flash[:success] = t "success_delete"
      redirect_to root_url
    else
      flash[:danger] = t "error"
      redirect_to :back
    end
  end

  def show
    @user = load_user
  end

  private
  def load_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t "user.not_found"
      redirect_to :back
    end
  end
end
