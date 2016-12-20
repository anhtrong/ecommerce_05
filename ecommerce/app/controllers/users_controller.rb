class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_user, only: :show
  load_and_authorize_resource

  def create
    @user = User.new user_params
    if @user.save
      user_login @user
      flash[:success] = t "success_signup"
      redirect_to root_url
    else
      flash[:info] = @user.errors.full_messages
      render :new
    end
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "success_update"
      redirect_to @user
    else
      flash[:error] = t "error"
      redirect_to :back
    end
  end

  def show
    @user = load_user
  end

  private
  def user_params
    params.require(:user).permit :email, :full_name, :password,
      :password_confirmation
  end

  def load_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t "erorr"
      redirect_to :back
    end
  end
end
