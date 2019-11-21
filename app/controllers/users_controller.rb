class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
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
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:user_name, :password, :password_confirmation, :email)
  end
end
