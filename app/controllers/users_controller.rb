class UsersController < ApplicationController
  def index

  end

  def create
    render :layout => "no_search"
    @user = User.new(user_params)
    if @user.save
      render html: "create user"
    else
      render 'create'
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
  end
end
