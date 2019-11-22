class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  
  def index
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
    render layout: "no_search"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # flash[:success] = "Welcome to the Sample App!"
      log_in @user
      redirect_to @user
    else
      render :new, layout: "no_search"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if@user.update_attributes(update_user_params)
      # flash[:success] = 'Profile updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:user_name, :password, :password_confirmation, :email)
  end

  def update_user_params
    params.require(:user).permit(:user_name, :email, :phone_number, :name, :address, :evaluation_point, :password, :introduction, :password_confirmation)
  end

  # ログイン済ユーザーかどうか確認
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'ログインしてください'
      redirect_to login_url
    end
  end

  # 正しいユーザーかどうか確認\
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
